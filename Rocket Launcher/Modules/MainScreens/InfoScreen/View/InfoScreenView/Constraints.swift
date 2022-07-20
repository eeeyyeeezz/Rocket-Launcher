//
//  Constraints.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 20.07.2022.
//

import UIKit

extension InfoScreenView {

  func addConstraints() {
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
      parametrsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
      parametrsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      parametrsCollectionView.heightAnchor.constraint(equalToConstant: 100)
    ])

    addSubview(firstInfoLabel)
    NSLayoutConstraint.activate([
      firstInfoLabel.topAnchor.constraint(equalTo: parametrsCollectionView.bottomAnchor, constant: 20),
      firstInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
    ])

    addSubview(infoValueLabel)
    NSLayoutConstraint.activate([
      infoValueLabel.topAnchor.constraint(equalTo: parametrsCollectionView.bottomAnchor, constant: 20),
      infoValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])

    let firstStepLabel = getLabel(text: "ПЕРВАЯ СТУПЕНЬ",
                                  numberOfLines: 1,
                                  color: #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1),
                                  font: UIFont.boldSystemFont(ofSize: 20.0))
    addSubview(firstStepLabel)
    NSLayoutConstraint.activate([
      firstStepLabel.topAnchor.constraint(equalTo: firstInfoLabel.bottomAnchor, constant: -10),
      firstStepLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
    ])

    addSubview(firstStepInfoLabel)
    NSLayoutConstraint.activate([
      firstStepInfoLabel.topAnchor.constraint(equalTo: firstStepLabel.bottomAnchor, constant: 20),
      firstStepInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
    ])

    addSubview(firstStepValueLabel)
    NSLayoutConstraint.activate([
      firstStepValueLabel.topAnchor.constraint(equalTo: firstStepLabel.bottomAnchor, constant: 20),
      firstStepValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor)
    ])
  }

}
