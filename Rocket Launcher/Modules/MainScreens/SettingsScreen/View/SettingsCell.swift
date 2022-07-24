//
//  File.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 23.07.2022.
//

import UIKit

class SettingsCell: UITableViewCell {
    static let identifier = "SettingsCell"

    var cellId: Int?

    private lazy var viewModel = SettingsCellViewModel(cellId: cellId)

    private lazy var rocketSwitch: UISwitch = {
        let rocketSwitch = UISwitch()
        rocketSwitch.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        rocketSwitch.translatesAutoresizingMaskIntoConstraints = false
        return rocketSwitch
    }()

    let valueLabel: UILabel = {
        let label = UILabel()
        label.text = "Value"
        label.textColor = .white
        label.font = UILabel().font.withSize(17)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraints()
    }

    private func addConstraints() {
        contentView.addSubview(rocketSwitch)
        NSLayoutConstraint.activate([
            rocketSwitch.centerYAnchor.constraint(equalTo: centerYAnchor),
            rocketSwitch.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
        ])

        addSubview(valueLabel)
        NSLayoutConstraint.activate([
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            valueLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            valueLabel.trailingAnchor.constraint(equalTo: rocketSwitch.leadingAnchor),
            valueLabel.heightAnchor.constraint(equalToConstant: 50),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc
    private func handleSwitch() {
        viewModel.changeSwitchValue()
    }
}
