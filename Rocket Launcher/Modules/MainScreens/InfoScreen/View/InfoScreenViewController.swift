//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit
import RxSwift

class InfoScreenViewController: UIViewController {

  private lazy var rocketCollectionView = RocketsCollectionView(rocketStruct: [])

	private let viewModel = InfoScreenViewModel()

	private let disposeBag = DisposeBag()

  private lazy var backgroundCover: UIImageView = {
    let image = UIImageView(image: UIImage(named: "FalconHeavy"))
    image.contentMode = .scaleAspectFill
    image.frame = view.bounds
    return image
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
    setupBinding()
  }

  private func setupBinding() {
    view.addSubview(backgroundCover)

    viewModel.rocketStruct.subscribe { result in
      self.rocketCollectionView.rocketStruct = result.element
      DispatchQueue.main.async {
        self.addConstraints()
      }
    }.disposed(by: disposeBag)
  }

  override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
    .portrait
  }

  private func addConstraints() {
    let infoScreenView = InfoScreenView(frame: view.bounds, rocketStruct: nil)
    infoScreenView.translatesAutoresizingMaskIntoConstraints = false
    view.addSubview(infoScreenView)
    NSLayoutConstraint.activate([
      infoScreenView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
      infoScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      infoScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      infoScreenView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])

//    view.addSubview(rocketCollectionView)
//    NSLayoutConstraint.activate([
//      rocketCollectionView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
//      rocketCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//      rocketCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
//      rocketCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
//    ])
  }


}

