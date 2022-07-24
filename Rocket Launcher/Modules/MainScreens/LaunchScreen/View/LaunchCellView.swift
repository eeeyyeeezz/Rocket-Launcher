//
//  LaunchCellView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 24.07.2022.
//

import UIKit

class LaunchCellView: UIView {
    var launchStruct: LaunchStruct?

    private let resultImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    private let launchName: UILabel = {
        let label = UILabel()
        label.numberOfLines = 2
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 25.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let launchDate: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 0.5529411765, green: 0.5568627451, blue: 0.5568627451, alpha: 1)
        label.textAlignment = .left
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont.boldSystemFont(ofSize: 17.0)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    init(frame: CGRect, launchStruct: LaunchStruct?) {
        self.launchStruct = launchStruct
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1294117647, green: 0.1294117647, blue: 0.1294117647, alpha: 1)
        layer.cornerRadius = 15
        translatesAutoresizingMaskIntoConstraints = false
        setupBinding()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addConstraints()
    }

    private func setupBinding() {
        guard let launchStruct = launchStruct else { return }
        resultImage.image = UIImage(named: launchStruct.success ?? false ? "Success" : "Failure")
        launchName.text = launchStruct.name
        if let dateString = launchStruct.date_utc {
            launchDate.text = String.getDate(String(dateString.dropLast(14)), "yyyy-MM-dd")
        }
    }

    private func addConstraints() {
        addSubview(resultImage)
        NSLayoutConstraint.activate([
            resultImage.centerYAnchor.constraint(equalTo: centerYAnchor),
            resultImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            resultImage.widthAnchor.constraint(equalToConstant: 35),
            resultImage.heightAnchor.constraint(equalToConstant: 35),
        ])

        addSubview(launchName)
        NSLayoutConstraint.activate([
            launchName.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -15),
            launchName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            launchName.trailingAnchor.constraint(equalTo: resultImage.leadingAnchor),
        ])

        addSubview(launchDate)
        NSLayoutConstraint.activate([
            launchDate.topAnchor.constraint(equalTo: launchName.bottomAnchor, constant: 10),
            launchDate.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
        ])
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
