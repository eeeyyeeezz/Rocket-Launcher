//
//  InfoScreenCollectionViewCell.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 21.07.2022.
//

import UIKit

class InfoScreenCollectionViewCell: UICollectionViewCell {
    static let identifier = "InfoScreenCollectionViewCell"

    override init(frame: CGRect) {
        super.init(frame: frame)
//        backgroundColor = .white
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
