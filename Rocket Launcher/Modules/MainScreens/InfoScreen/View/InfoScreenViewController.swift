//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class InfoScreenViewController: UIViewController {

  private lazy var rocketCollectionView = RocketsCollectionView(rocketStruct:
                                                                  viewModel.rocketStruct ?? [])

	private let viewModel = InfoScreenViewModel()

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

    view.addSubview(rocketCollectionView)
    NSLayoutConstraint.activate([
      rocketCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
      rocketCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      rocketCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      rocketCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }


}

