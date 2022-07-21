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
        backgroundColor = nil
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        if let infoView = infoView {
            addSubview(infoView)
        }
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
