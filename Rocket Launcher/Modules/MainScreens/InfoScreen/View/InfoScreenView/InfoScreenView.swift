//
//  InfoScreenView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class InfoScreenView: UIView {

  lazy var parametrsCollectionView = ParametrsCollectionView(rocketStruct: rocketStruct)

  let rocketStruct: RocketStruct?

  ///  Иннициализация происходит в методе setupLabels()
  var rocketName: UILabel!

  var firstInfoLabel: UILabel!

  var infoValueLabel: UILabel!

  var firstStepInfoLabel: UILabel!

  var firstStepValueLabel: UILabel!

  init(frame: CGRect, rocketStruct: RocketStruct?) {
    self.rocketStruct = rocketStruct
    super.init(frame: frame)
    backgroundColor = .black
  }

  private func setupBinding() {
    setupLabels()
    addConstraints()
    roundCorners(corners: [.topLeft, .topRight], radius: 25.0)
//    contentOffset.x = 0 // Скролл доступен только по вертикали
//    isDirectionalLockEnabled = true
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    setupBinding()
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
