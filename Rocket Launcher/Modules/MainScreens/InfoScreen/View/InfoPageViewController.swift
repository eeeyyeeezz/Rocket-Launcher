//
//  InfoPageViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 22.07.2022.
//

import UIKit

class InfoPageViewController: UIPageViewController {

    private let arrayInfoScreen: [InfoScreenViewController] = {
        var array = [InfoScreenViewController]()
        for i in 0...3 {
            array.append(InfoScreenViewController(rocketId: i))
        }
        return array
    }()

    override init(transitionStyle style: UIPageViewController.TransitionStyle, navigationOrientation: UIPageViewController.NavigationOrientation, options: [UIPageViewController.OptionsKey : Any]? = nil) {
        super.init(transitionStyle: .scroll, navigationOrientation: navigationOrientation, options: options)
        view.backgroundColor = .black
        dataSource = self
        delegate = self
        setViewControllers([arrayInfoScreen[0]], direction: .forward, animated: true)
//        setViewControllers([LaunchScreenViewController(rocketStruct: nil)], direction: .forward, animated: true)
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension InfoPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let randomInt = Int.random(in: 0...3)
        let vc = InfoScreenViewController(rocketId: randomInt)
        return vc
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let randomInt = Int.random(in: 0...3)
        let vc = InfoScreenViewController(rocketId: randomInt)
        return vc
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int { 4 }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int { 0 }
}
