//
//  InfoScreenView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class InfoScreenView: UIView {

  private lazy var parametrsCollectionView = ParametrsCollectionView(rocketStruct: rocketStruct!)

  private let rocketStruct: RocketStruct?

  private let rocketName: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = label.font.withSize(32)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  init(frame: CGRect, rocketStruct: RocketStruct) {
    self.rocketStruct = rocketStruct
    super.init(frame: frame)
    backgroundColor = .black
    layer.cornerRadius = 25
  }

  override func layoutSubviews() {
    super.layoutSubviews()
		setupBinding()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension InfoScreenView {

  private func setupBinding() {
    rocketName.text = rocketStruct?.name
    addConstraints()
  }

  private func addConstraints() {
    addSubview(rocketName)
    NSLayoutConstraint.activate([
      rocketName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      rocketName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
      rocketName.trailingAnchor.constraint(equalTo: trailingAnchor),
      rocketName.heightAnchor.constraint(equalToConstant: 50)
    ])

    addSubview(parametrsCollectionView)
    NSLayoutConstraint.activate([
      parametrsCollectionView.topAnchor.constraint(equalTo: rocketName.bottomAnchor, constant: 20),
      parametrsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
      parametrsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -35),
      parametrsCollectionView.heightAnchor.constraint(equalToConstant: 100)
    ])
  }

}
