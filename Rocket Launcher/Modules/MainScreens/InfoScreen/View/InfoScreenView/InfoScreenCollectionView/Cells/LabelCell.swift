//
//  LabelCell.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 21.07.2022.
//

import UIKit

class LabelCell: UICollectionViewCell {
    static let identifier = "InfoScreenCollectionViewLabelCell"

    var mainLabel: UILabel?

    var valueLabel: UILabel?

    var cellId: Int?

    private lazy var button: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Посмотреть запуски", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(openLauchScreen), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
//    backgroundColor = .blue
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupBinding()
    }

    func setupBinding() {
        if let mainLabel = mainLabel {
            addSubview(mainLabel)
            NSLayoutConstraint.activate([
                mainLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
                mainLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }

        if let valueLabel = valueLabel {
            valueLabel.textAlignment = .right
            addSubview(valueLabel)
            NSLayoutConstraint.activate([
                valueLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            ])
        }

        if cellId == 7 {
            addSubview(button)
            NSLayoutConstraint.activate([
                button.topAnchor.constraint(equalTo: topAnchor, constant: 30),
                button.centerXAnchor.constraint(equalTo: centerXAnchor),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                button.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
    }

    @objc
    private func openLauchScreen() {
//    let launchScreen = LaunchScreenViewController()
        debugPrint("Launch Screen")
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
