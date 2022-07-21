//
//  Labels.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 20.07.2022.
//

import UIKit

extension InfoScreenView {
    func getLabel(text: String, numberOfLines: Int = 0, color: UIColor, font: UIFont) -> UILabel {
        let label = UILabel()
        label.textColor = color
        label.text = text
        label.font = font
        label.numberOfLines = numberOfLines
        label.text = text
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }

    func setupLabels() {
        firstInfoLabel = getLabel(text: "Первый запуск\n\n"
            + "Страна\n\n"
            + "Стоимость запуска\n\n",
            color: #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6823529412, alpha: 1),
            font: UIFont.boldSystemFont(ofSize: 15.0))

        rocketName = getLabel(text: rocketStruct?.name ?? "RocketError",
                              numberOfLines: 1,
                              color: .white,
                              font: UILabel().font.withSize(32))

        infoValueLabel = getLabel(text: "\(rocketStruct?.firstFlight ?? "noinfo")\n\n"
            + "\(rocketStruct?.country ?? "noinfo")\n\n"
            + "$\((rocketStruct?.costPerLaunch ?? 0) / 1_000_000) млн\n\n",
            color: #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1),
            font: UILabel().font.withSize(15))
        infoValueLabel.textAlignment = .right

        firstStepInfoLabel = getLabel(text: "Количество двигателей\n\n"
            + "Количество топлива в тоннах\n\n"
            + "Время сгорания в секундах\n\n",
            color: #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6823529412, alpha: 1),
            font: UILabel().font.withSize(15))

        firstStepValueLabel = getLabel(text: "\(rocketStruct?.firstStage.engines ?? 0)\n\n"
            + "\(rocketStruct?.firstStage.fuelAmountTons ?? 0)\n\n"
            + "\(rocketStruct?.firstStage.burnTimeSec ?? 0)\n\n",
            color: #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1),
            font: UILabel().font.withSize(15))
        firstStepValueLabel.textAlignment = .right

        secondStepInfoLabel = getLabel(text: "Количество двигателей\n\n"
            + "Количество топлива в тоннах\n\n"
            + "Время сгорания в секундах\n\n",
            color: #colorLiteral(red: 0.6784313725, green: 0.6784313725, blue: 0.6823529412, alpha: 1),
            font: UILabel().font.withSize(15))

        secondStepValueLabel = getLabel(text: "\(rocketStruct?.secondStage.engines ?? 0)\n\n"
            + "\(rocketStruct?.secondStage.fuelAmountTons ?? 0)\n\n"
            + "\(rocketStruct?.secondStage.burnTimeSec ?? 0)\n\n",
            color: #colorLiteral(red: 0.9960784314, green: 0.9960784314, blue: 0.9960784314, alpha: 1),
            font: UILabel().font.withSize(15))
        secondStepValueLabel.textAlignment = .right
    }
}
