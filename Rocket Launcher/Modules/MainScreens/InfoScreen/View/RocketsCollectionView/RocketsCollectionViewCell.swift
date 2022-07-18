//
//  RocketsCollectionViewCell.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class RocketsCollectionViewCell: UICollectionViewCell {

  static let identifier: String = "RocketsCollectionViewCell"

  var infoView: InfoScreenView?

  override init(frame: CGRect) {
    super.init(frame: frame)

  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
