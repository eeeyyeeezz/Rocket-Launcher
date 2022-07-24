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
        let button = UIButton(type: .system)
        button.setTitle("Посмотреть запуски", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        button.layer.cornerRadius = 15
        button.addTarget(self, action: #selector(openLauchScreen), for: .touchUpInside)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    lazy var settingsButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "settings")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.addTarget(self, action: #selector(openSettingsScreen), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        setupBinding()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        cellId = nil
        mainLabel = nil
        valueLabel = nil
        button.isHidden = true
        settingsButton.isHidden = true
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

        if cellId == 0 {
            settingsButton.isHidden = false
            addSubview(settingsButton)
            NSLayoutConstraint.activate([
                settingsButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
                settingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
                settingsButton.heightAnchor.constraint(equalToConstant: 25),
                settingsButton.widthAnchor.constraint(equalToConstant: 25),
            ])
        }

        if cellId == 7 {
            button.isHidden = false
            addSubview(button)
            NSLayoutConstraint.activate([
                button.centerXAnchor.constraint(equalTo: centerXAnchor),
                button.centerYAnchor.constraint(equalTo: centerYAnchor),
                button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
                button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
                button.heightAnchor.constraint(equalToConstant: 50),
            ])
        }
    }

    @objc
    private func openLauchScreen() {
        NotificationCenter.default.post(name: .launchScreen, object: nil)
    }

    @objc
    func openSettingsScreen() {
        NotificationCenter.default.post(name: .settings, object: nil)
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
