//
//  InfoPageViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 22.07.2022.
//

import UIKit

class InfoPageViewController: UIPageViewController {

    override init(transitionStyle _: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey: Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        setViewControllers([InfoScreenViewController(rocketId: 0)], direction: .forward, animated: true)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {
    func pageViewController(_: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InfoScreenViewController else { return nil }
        let index = viewController.rocketId
        if index != 0 {
            return InfoScreenViewController(rocketId: index - 1)
        }
        return nil
    }

    func pageViewController(_: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewController = viewController as? InfoScreenViewController else { return nil }
        let index = viewController.rocketId
        if index != 3 {
            return InfoScreenViewController(rocketId: index + 1)
        }
        return nil
    }

    func presentationCount(for _: UIPageViewController) -> Int { 4 }

    func presentationIndex(for _: UIPageViewController) -> Int { 0 }
}
