//
//  InfoScreenView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class InfoScreenView: UIScrollView {

  private lazy var parametrsCollectionView = ParametrsCollectionView(rocketStruct: rocketStruct!)

  private let rocketStruct: RocketStruct?

  private let rocketName: UILabel = {
    let label = UILabel()
    label.textColor = .white
    label.font = label.font.withSize(32)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()

  private let infoLabel: UILabel = {
		let label = UILabel()
    label.textColor = #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6823529412, alpha: 1)
    label.font = label.font.withSize(15)
    label.numberOfLines = 0
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()


  init(frame: CGRect, rocketStruct: RocketStruct?) {
    self.rocketStruct = rocketStruct
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

  private func setupBinding() {
    rocketName.text = rocketStruct?.name
    setupInfoText()
    addConstraints()
    roundCorners(corners: [.topLeft, .topRight], radius: 25.0)
    contentOffset.x = 0 // Скролл доступен только по вертикали
    isDirectionalLockEnabled = true
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
    bringSubviewToFront(parametrsCollectionView)
    NSLayoutConstraint.activate([
      parametrsCollectionView.topAnchor.constraint(equalTo: rocketName.bottomAnchor, constant: 20),
      parametrsCollectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
      parametrsCollectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
      parametrsCollectionView.heightAnchor.constraint(equalToConstant: 100)
    ])

    addSubview(infoLabel)
    NSLayoutConstraint.activate([
      infoLabel.topAnchor.constraint(equalTo: parametrsCollectionView.bottomAnchor, constant: 20),
      infoLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 35),
      infoLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
      infoLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
    ])
  }

  private func setupInfoText() {
    infoLabel.text = "Первый запуск\t\t\t\t\(rocketStruct?.firstFlight ?? "noinfo")\n\n"
    + "Страна \(rocketStruct?.country ?? "noinfo")\n\n"
    + "Стоимость запуска $\((rocketStruct?.costPerLaunch ?? 0) / 1000000) млн"


  }

}

extension UIView {
   func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds,
                                byRoundingCorners: corners,
                                cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
}
