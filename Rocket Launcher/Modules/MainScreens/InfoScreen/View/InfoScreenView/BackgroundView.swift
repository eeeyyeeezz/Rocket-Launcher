//
//  BackgroundView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 20.07.2022.
//

import UIKit

/// Вьюшка с коллекшн вью
class BackgroundView: UIView {

  lazy var parametrsCollectionView = ParametrsCollectionView(rocketStruct: rocketStruct)

  var rocketStruct: RocketStruct?

  init(frame: CGRect, rocketStruct: RocketStruct?) {
    self.rocketStruct = rocketStruct
    super.init(frame: frame)
    backgroundColor = .white
    translatesAutoresizingMaskIntoConstraints = false
  }

  override func layoutSubviews() {
    super.layoutSubviews()
//    addSubview(parametrsCollectionView)
//    NSLayoutConstraint.activate([
//      parametrsCollectionView.topAnchor.constraint(equalTo: topAnchor),
//      parametrsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
//      parametrsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
//      parametrsCollectionView.heightAnchor.constraint(equalToConstant: 100)
//    ])
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
