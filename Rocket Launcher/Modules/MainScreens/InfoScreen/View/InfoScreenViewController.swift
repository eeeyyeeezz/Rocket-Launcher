//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import RxSwift
import UIKit

class InfoScreenViewController: UIPageViewController {
    private let viewModel = InfoScreenViewModel()

    private let disposeBag = DisposeBag()

//    let arrayInfoScreenViewControllers: [InfoScreenViewController] = {
//		var arrayInfo = [InfoScreenViewController]()
//        for _ in 0...3 {
//            arrayInfo.append(InfoScreenViewController())
//        }
//        return arrayInfo
//    }()

    private lazy var backgroundCover: UIImageView = {
        let image = UIImageView(image: UIImage(named: "FalconHeavy"))
        image.contentMode = .scaleAspectFill
        image.frame = view.bounds
        return image
    }()

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        setViewControllers([UIViewController()], direction: .forward, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        viewModel.rocketStruct.asObservable().subscribe(onNext: { result in
            DispatchQueue.main.async {
            	self.addConstraints(rocketStruct: result)
            }
        }).disposed(by: disposeBag)
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

 	 private func addConstraints(rocketStruct: [RocketStruct]) {
		debugPrint(rocketStruct.count)
        let randomInt = Int.random(in: 0...2)
        let infoScreenView = InfoScreenCollectionView(frame: view.frame, rocketStruct: rocketStruct[randomInt])
        view.addSubview(infoScreenView)
        NSLayoutConstraint.activate([
            infoScreenView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            infoScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
        ])

//        view.addSubview(backgroundCover)
        view.bringSubviewToFront(infoScreenView)
    }

    required init?(coder aDecoder: NSCoder) {
       super.init(coder: aDecoder)
    }
}

extension InfoScreenViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let vc = InfoScreenViewController()
		return vc
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let vc = InfoScreenViewController()
        return vc
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int { 4 }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int { 2 }

}
