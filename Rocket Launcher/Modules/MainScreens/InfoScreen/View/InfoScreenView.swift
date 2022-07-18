//
//  InfoScreenView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class InfoScreenView: UIView {

  private let rocketName: UILabel = {
		let label = UILabel()
    label.text = "Test Rocket"
    label.textColor = .white
    label.font = label.font.withSize(32)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()


  override init(frame: CGRect) {
    super.init(frame: frame)
    backgroundColor = .black
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

  func setupBinding() {
		addSubview(rocketName)
    NSLayoutConstraint.activate([
      rocketName.topAnchor.constraint(equalTo: topAnchor, constant: 20),
      rocketName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
      rocketName.trailingAnchor.constraint(equalTo: trailingAnchor),
      rocketName.heightAnchor.constraint(equalToConstant: 50)
    ])
  }

}
