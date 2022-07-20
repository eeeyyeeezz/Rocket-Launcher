//
//  InfoScreenView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class InfoScreenView: UIScrollView {

  let rocketStruct: RocketStruct?

  ///  Иннициализация происходит в методе setupLabels()
  var rocketName: UILabel!

  var firstInfoLabel: UILabel!

  var infoValueLabel: UILabel!

  var firstStepInfoLabel: UILabel!

  var firstStepValueLabel: UILabel!

  var secondStepInfoLabel: UILabel!

  var secondStepValueLabel: UILabel!

  let settingsButton: UIButton = {
    let button = UIButton()
    button.setImage(UIImage(named: "gear"), for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  init(frame: CGRect, rocketStruct: RocketStruct?) {
    self.rocketStruct = rocketStruct
    super.init(frame: frame)
    backgroundColor = .black
//    contentSize = frame.size
    setupBinding()
  }

  private func setupBinding() {
    setupLabels()
    addConstraints()
    roundCorners(corners: [.topLeft, .topRight], radius: 25.0)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
