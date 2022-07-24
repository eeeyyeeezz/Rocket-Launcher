//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import RxRelay
import RxSwift
import UIKit

class InfoScreenViewController: UIViewController {
    let rocketId: Int

    private let viewModel = InfoScreenViewModel()

    private var rocketStruct: [RocketStruct] = []

    private var launchStruct: [LaunchStruct] = []

    private let disposeBag = DisposeBag()

    private lazy var backgroundCover: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

    init(rocketId: Int) {
        self.rocketId = rocketId
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(openLaunchScreen),
                                               name: .launchScreen,
                                               object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(openSettingsScreen),
                                               name: .settings,
                                               object: nil)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        NotificationCenter.default.removeObserver(self)
    }

    private func setupBinding() {
        view.backgroundColor = .black
        viewModel.rocketStruct.asObservable().subscribe(onNext: { [weak self] result in
            self?.rocketStruct = result
            DispatchQueue.main.async {
                self?.addConstraints()
            }
        }).disposed(by: disposeBag)

        viewModel.launchStruct.asObservable().subscribe(onNext: { [weak self] launchStruct in
            self?.launchStruct = launchStruct
        }).disposed(by: disposeBag)
    }

    private func addConstraints() {
        let infoScreenView = InfoScreenCollectionView(frame: view.frame, rocketStruct: rocketStruct[rocketId])
        view.addSubview(infoScreenView)
        NSLayoutConstraint.activate([
            infoScreenView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            infoScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])

        viewModel.setImage(backgroundCover: backgroundCover, rocketStruct: rocketStruct, rocketId: rocketId)
        view.addSubview(backgroundCover)
        NSLayoutConstraint.activate([
            backgroundCover.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundCover.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundCover.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundCover.bottomAnchor.constraint(equalTo: view.centerYAnchor, constant: 100),
        ])
        view.bringSubviewToFront(infoScreenView)
    }

    @objc
    func openLaunchScreen() {
        let launchScreenViewController = LaunchScreenViewController(launchStruct: launchStruct,
                                                                    rocketName: rocketStruct[rocketId].name)
        navigationController?.pushViewController(launchScreenViewController, animated: true)
    }

    @objc
    func openSettingsScreen() {
        let settingsViewController = SettingsViewController()
        navigationController?.pushViewController(settingsViewController, animated: true)
    }

    required init?(coder aDecoder: NSCoder) {
        rocketId = 0
        super.init(coder: aDecoder)
    }
}
