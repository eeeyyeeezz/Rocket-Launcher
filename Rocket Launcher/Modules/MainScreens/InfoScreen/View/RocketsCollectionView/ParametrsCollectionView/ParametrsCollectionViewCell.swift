//
//  InfoCollectionViewCell.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class ParametrsCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "ParametrsCollectionViewCell"

    lazy var value: UILabel = {
        let label = UILabel()
        label.font = label.font.withSize(17)
        label.textColor = .white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var magnitude: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5333333333, green: 0.537254902, blue: 0.537254902, alpha: 1)
        label.font = label.font.withSize(14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1058823529, green: 0.1019607843, blue: 0.1019607843, alpha: 1)
        layer.cornerRadius = 25
        setupBinding()
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ParametrsCollectionViewCell {
    func setupBinding() {
        addSubview(value)
        NSLayoutConstraint.activate([
            value.centerXAnchor.constraint(equalTo: centerXAnchor),
            value.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -10),
        ])

        addSubview(magnitude)
        NSLayoutConstraint.activate([
            magnitude.centerXAnchor.constraint(equalTo: centerXAnchor),
            magnitude.centerYAnchor.constraint(equalTo: centerYAnchor, constant: 15),
        ])
    }
}
