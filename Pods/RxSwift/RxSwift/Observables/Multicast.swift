//
//  Multicast.swift
//  RxSwift
//
//  Created by Krunoslav Zaher on 2/27/15.
//  Copyright © 2015 Krunoslav Zaher. All rights reserved.
//

/**
 Represents an observable wrapper that can be connected and disconnected from its underlying observable sequence.
 */
public class ConnectableObservable<Element>:
    Observable<Element>,
    ConnectableObservableType
{
    /**
     Connects the observable wrapper to its source. All subscribed observers will receive values from the underlying observable sequence as long as the connection is established.

     - returns: Disposable used to disconnect the observable wrapper from its source, causing subscribed observer to stop receiving values from the underlying observable sequence.
     */
    public func connect() -> Disposable {
        rxAbstractMethod()
    }
}

public extension ObservableType {
    /**
     Multicasts the source sequence notifications through an instantiated subject into all uses of the sequence within a selector function.

     Each subscription to the resulting sequence causes a separate multicast invocation, exposing the sequence resulting from the selector function's invocation.

     For specializations with fixed subject types, see `publish` and `replay`.

     - seealso: [multicast operator on reactivex.io](http://reactivex.io/documentation/operators/publish.html)

     - parameter subjectSelector: Factory function to create an intermediate subject through which the source sequence's elements will be multicast to the selector function.
     - parameter selector: Selector function which can use the multicasted source sequence subject to the policies enforced by the created subject.
     - returns: An observable sequence that contains the elements of a sequence produced by multicasting the source sequence within a selector function.
     */
    func multicast<Subject: SubjectType, Result>(_ subjectSelector: @escaping () throws -> Subject, selector: @escaping (Observable<Subject.Element>) throws -> Observable<Result>)
        -> Observable<Result> where Subject.Observer.Element == Element
    {
        return Multicast(
            source: asObservable(),
            subjectSelector: subjectSelector,
            selector: selector
        )
    }
}

public extension ObservableType {
    /**
     Returns a connectable observable sequence that shares a single subscription to the underlying sequence.

     This operator is a specialization of `multicast` using a `PublishSubject`.

     - seealso: [publish operator on reactivex.io](http://reactivex.io/documentation/operators/publish.html)

     - returns: A connectable observable sequence that shares a single subscription to the underlying sequence.
     */
    func publish() -> ConnectableObservable<Element> {
        multicast { PublishSubject() }
    }
}

public extension ObservableType {
    /**
     Returns a connectable observable sequence that shares a single subscription to the underlying sequence replaying bufferSize elements.

     This operator is a specialization of `multicast` using a `ReplaySubject`.

     - seealso: [replay operator on reactivex.io](http://reactivex.io/documentation/operators/replay.html)

     - parameter bufferSize: Maximum element count of the replay buffer.
     - returns: A connectable observable sequence that shares a single subscription to the underlying sequence.
     */
    func replay(_ bufferSize: Int)
        -> ConnectableObservable<Element>
    {
        multicast { ReplaySubject.create(bufferSize: bufferSize) }
    }

    /**
     Returns a connectable observable sequence that shares a single subscription to the underlying sequence replaying all elements.

     This operator is a specialization of `multicast` using a `ReplaySubject`.

     - seealso: [replay operator on reactivex.io](http://reactivex.io/documentation/operators/replay.html)

     - returns: A connectable observable sequence that shares a single subscription to the underlying sequence.
     */
    func replayAll()
        -> ConnectableObservable<Element>
    {
        multicast { ReplaySubject.createUnbounded() }
    }
}

public extension ConnectableObservableType {
    /**
     Returns an observable sequence that stays connected to the source as long as there is at least one subscription to the observable sequence.

     - seealso: [refCount operator on reactivex.io](http://reactivex.io/documentation/operators/refcount.html)

     - returns: An observable sequence that stays connected to the source as long as there is at least one subscription to the observable sequence.
     */
    func refCount() -> Observable<Element> {
        RefCount(source: self)
    }
}

public extension ObservableType {
    /**
     Multicasts the source sequence notifications through the specified subject to the resulting connectable observable.

     Upon connection of the connectable observable, the subject is subscribed to the source exactly one, and messages are forwarded to the observers registered with the connectable observable.

     For specializations with fixed subject types, see `publish` and `replay`.

     - seealso: [multicast operator on reactivex.io](http://reactivex.io/documentation/operators/publish.html)

     - parameter subject: Subject to push source elements into.
     - returns: A connectable observable sequence that upon connection causes the source sequence to push results into the specified subject.
     */
    func multicast<Subject: SubjectType>(_ subject: Subject)
        -> ConnectableObservable<Subject.Element> where Subject.Observer.Element == Element
    {
        ConnectableObservableAdapter(source: asObservable(), makeSubject: { subject })
    }

    /**
     Multicasts the source sequence notifications through an instantiated subject to the resulting connectable observable.

     Upon connection of the connectable observable, the subject is subscribed to the source exactly one, and messages are forwarded to the observers registered with the connectable observable.

     Subject is cleared on connection disposal or in case source sequence produces terminal event.

     - seealso: [multicast operator on reactivex.io](http://reactivex.io/documentation/operators/publish.html)

     - parameter makeSubject: Factory function used to instantiate a subject for each connection.
     - returns: A connectable observable sequence that upon connection causes the source sequence to push results into the specified subject.
     */
    func multicast<Subject: SubjectType>(makeSubject: @escaping () -> Subject)
        -> ConnectableObservable<Subject.Element> where Subject.Observer.Element == Element
    {
        ConnectableObservableAdapter(source: asObservable(), makeSubject: makeSubject)
    }
}

private final class Connection<Subject: SubjectType>: ObserverType, Disposable {
    typealias Element = Subject.Observer.Element

    private var lock: RecursiveLock
    // state
    private var parent: ConnectableObservableAdapter<Subject>?
    private var subscription: Disposable?
    private var subjectObserver: Subject.Observer

    private let disposed = AtomicInt(0)

    init(parent: ConnectableObservableAdapter<Subject>, subjectObserver: Subject.Observer, lock: RecursiveLock, subscription: Disposable) {
        self.parent = parent
        self.subscription = subscription
        self.lock = lock
        self.subjectObserver = subjectObserver
    }

    func on(_ event: Event<Subject.Observer.Element>) {
        if isFlagSet(disposed, 1) {
            return
        }
        if event.isStopEvent {
            dispose()
        }
        subjectObserver.on(event)
    }

    func dispose() {
        lock.lock(); defer { lock.unlock() }
        fetchOr(disposed, 1)
        guard let parent = parent else {
            return
        }

        if parent.connection === self {
            parent.connection = nil
            parent.subject = nil
        }
        self.parent = nil

        subscription?.dispose()
        subscription = nil
    }
}

private final class ConnectableObservableAdapter<Subject: SubjectType>:
    ConnectableObservable<Subject.Element>
{
    typealias ConnectionType = Connection<Subject>

    private let source: Observable<Subject.Observer.Element>
    private let makeSubject: () -> Subject

    fileprivate let lock = RecursiveLock()
    fileprivate var subject: Subject?

    // state
    fileprivate var connection: ConnectionType?

    init(source: Observable<Subject.Observer.Element>, makeSubject: @escaping () -> Subject) {
        self.source = source
        self.makeSubject = makeSubject
        subject = nil
        connection = nil
    }

    override func connect() -> Disposable {
        return lock.performLocked {
            if let connection = self.connection {
                return connection
            }

            let singleAssignmentDisposable = SingleAssignmentDisposable()
            let connection = Connection(parent: self, subjectObserver: self.lazySubject.asObserver(), lock: self.lock, subscription: singleAssignmentDisposable)
            self.connection = connection
            let subscription = self.source.subscribe(connection)
            singleAssignmentDisposable.setDisposable(subscription)
            return connection
        }
    }

    private var lazySubject: Subject {
        if let subject = self.subject {
            return subject
        }

        let subject = self.makeSubject()
        self.subject = subject
        return subject
    }

    override func subscribe<Observer: ObserverType>(_ observer: Observer) -> Disposable where Observer.Element == Subject.Element {
        lazySubject.subscribe(observer)
    }
}

private final class RefCountSink<ConnectableSource: ConnectableObservableType, Observer: ObserverType>:
    Sink<Observer>,
    ObserverType where ConnectableSource.Element == Observer.Element
{
    typealias Element = Observer.Element
    typealias Parent = RefCount<ConnectableSource>

    private let parent: Parent

    private var connectionIdSnapshot: Int64 = -1

    init(parent: Parent, observer: Observer, cancel: Cancelable) {
        self.parent = parent
        super.init(observer: observer, cancel: cancel)
    }

    func run() -> Disposable {
        let subscription = parent.source.subscribe(self)
        parent.lock.lock(); defer { self.parent.lock.unlock() }

        connectionIdSnapshot = parent.connectionId

        if isDisposed {
            return Disposables.create()
        }

        if parent.count == 0 {
            parent.count = 1
            parent.connectableSubscription = parent.source.connect()
        } else {
            parent.count += 1
        }

        return Disposables.create {
            subscription.dispose()
            self.parent.lock.lock(); defer { self.parent.lock.unlock() }
            if self.parent.connectionId != self.connectionIdSnapshot {
                return
            }
            if self.parent.count == 1 {
                self.parent.count = 0
                guard let connectableSubscription = self.parent.connectableSubscription else {
                    return
                }

                connectableSubscription.dispose()
                self.parent.connectableSubscription = nil
            } else if self.parent.count > 1 {
                self.parent.count -= 1
            } else {
                rxFatalError("Something went wrong with RefCount disposing mechanism")
            }
        }
    }

    func on(_ event: Event<Element>) {
        switch event {
        case .next:
            forwardOn(event)
        case .error, .completed:
            parent.lock.lock()
            if parent.connectionId == connectionIdSnapshot {
                let connection = parent.connectableSubscription
                defer { connection?.dispose() }
                parent.count = 0
                parent.connectionId = parent.connectionId &+ 1
                parent.connectableSubscription = nil
            }
            parent.lock.unlock()
            forwardOn(event)
            dispose()
        }
    }
}

private final class RefCount<ConnectableSource: ConnectableObservableType>: Producer<ConnectableSource.Element> {
    fileprivate let lock = RecursiveLock()

    // state
    fileprivate var count = 0
    fileprivate var connectionId: Int64 = 0
    fileprivate var connectableSubscription = nil as Disposable?

    fileprivate let source: ConnectableSource

    init(source: ConnectableSource) {
        self.source = source
    }

    override func run<Observer: ObserverType>(_ observer: Observer, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable)
        where Observer.Element == ConnectableSource.Element
    {
        let sink = RefCountSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
    }
}

private final class MulticastSink<Subject: SubjectType, Observer: ObserverType>: Sink<Observer>, ObserverType {
    typealias Element = Observer.Element
    typealias ResultType = Element
    typealias MutlicastType = Multicast<Subject, Observer.Element>

    private let parent: MutlicastType

    init(parent: MutlicastType, observer: Observer, cancel: Cancelable) {
        self.parent = parent
        super.init(observer: observer, cancel: cancel)
    }

    func run() -> Disposable {
        do {
            let subject = try parent.subjectSelector()
            let connectable = ConnectableObservableAdapter(source: parent.source, makeSubject: { subject })

            let observable = try parent.selector(connectable)

            let subscription = observable.subscribe(self)
            let connection = connectable.connect()

            return Disposables.create(subscription, connection)
        } catch let e {
            self.forwardOn(.error(e))
            self.dispose()
            return Disposables.create()
        }
    }

    func on(_ event: Event<ResultType>) {
        forwardOn(event)
        switch event {
        case .next: break
        case .error, .completed:
            dispose()
        }
    }
}

private final class Multicast<Subject: SubjectType, Result>: Producer<Result> {
    typealias SubjectSelectorType = () throws -> Subject
    typealias SelectorType = (Observable<Subject.Element>) throws -> Observable<Result>

    fileprivate let source: Observable<Subject.Observer.Element>
    fileprivate let subjectSelector: SubjectSelectorType
    fileprivate let selector: SelectorType

    init(source: Observable<Subject.Observer.Element>, subjectSelector: @escaping SubjectSelectorType, selector: @escaping SelectorType) {
        self.source = source
        self.subjectSelector = subjectSelector
        self.selector = selector
    }

    override func run<Observer: ObserverType>(_ observer: Observer, cancel: Cancelable) -> (sink: Disposable, subscription: Disposable) where Observer.Element == Result {
        let sink = MulticastSink(parent: self, observer: observer, cancel: cancel)
        let subscription = sink.run()
        return (sink: sink, subscription: subscription)
    }
}
