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
//      rocketName.heightAnchor.constraint(equalToConstant: 50)
    ])

    addSubview(settingsButton)
    NSLayoutConstraint.activate([
      settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 30),
      settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
      settingsButton.widthAnchor.constraint(equalToConstant: 30),
      settingsButton.heightAnchor.constraint(equalToConstant: 30)
    ])

    addSubview(firstInfoLabel)
    NSLayoutConstraint.activate([
      firstInfoLabel.topAnchor.constraint(equalTo: rocketName.bottomAnchor, constant: 20),
      firstInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
    ])

    addSubview(infoValueLabel)
    NSLayoutConstraint.activate([
      infoValueLabel.topAnchor.constraint(equalTo: rocketName.bottomAnchor, constant: 20),
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

    let secondStapeLabel = getLabel(text: "ВТОРАЯ СТУПЕНЬ",
                              numberOfLines: 1,
                              color: #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1),
                              font: UIFont.boldSystemFont(ofSize: 20.0))
    addSubview(secondStapeLabel)
    NSLayoutConstraint.activate([
      secondStapeLabel.topAnchor.constraint(equalTo: firstStepValueLabel.bottomAnchor, constant: -10),
      secondStapeLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
    ])

    addSubview(secondStepInfoLabel)
    NSLayoutConstraint.activate([
      secondStepInfoLabel.topAnchor.constraint(equalTo: secondStapeLabel.bottomAnchor, constant: 20),
      secondStepInfoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15)
    ])

    addSubview(secondStepValueLabel)
    NSLayoutConstraint.activate([
      secondStepValueLabel.topAnchor.constraint(equalTo: secondStapeLabel.bottomAnchor, constant: 20),
      secondStepValueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      secondStepValueLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
    
  }

}
