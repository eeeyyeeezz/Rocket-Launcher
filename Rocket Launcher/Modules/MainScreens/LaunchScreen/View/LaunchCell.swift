//
//  LaunchCell.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 24.07.2022.
//

import UIKit

class LaunchCell: UITableViewCell {
    static let identifier = "LaunchCell"

    var viewModel: LaunchCellViewModel?

    private lazy var launchCellView = LaunchCellView(frame: frame, launchStruct: viewModel?.getLaunchStruct())

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .black
        selectionStyle = .none
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraints()
    }

    private func addConstraints() {
        addSubview(launchCellView)
        NSLayoutConstraint.activate([
            launchCellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            launchCellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            launchCellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            launchCellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
