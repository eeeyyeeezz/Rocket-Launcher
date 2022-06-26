//
//  ScreenCollectionViewCell.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class ScreenCollectionViewCell: UICollectionViewCell {

  static let identifier: String = "ScreenCollectionViewCell"

  var customView: UIView?

  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .clear
  }

  override func layoutSubviews() {
    super.layoutSubviews()
    guard customView != nil else { return }
    addSubview(customView!)
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
