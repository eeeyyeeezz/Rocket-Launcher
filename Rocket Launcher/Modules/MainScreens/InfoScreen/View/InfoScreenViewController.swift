//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class InfoScreenViewController: UIViewController {

  private lazy var backgroundCover: UIImageView = {
    let image = UIImageView(image: UIImage(named: "FalconHeavy"))
    image.contentMode = .scaleAspectFill
    image.frame = view.bounds
    return image
  }()

  private lazy var infoView: UIView = {
		let view = InfoScreenView(frame: view.bounds)
    view.layer.cornerRadius = 30
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
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

    view.addSubview(infoView)
    NSLayoutConstraint.activate([
      infoView.topAnchor.constraint(equalTo: view.topAnchor, constant: 300),
      infoView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      infoView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      infoView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }


}

