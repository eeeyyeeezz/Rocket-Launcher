//
//  InfoScreenCollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 21.07.2022.
//

import UIKit

class InfoScreenCollectionView: UICollectionView {
    var rocketStruct: RocketStruct?

    init(frame: CGRect, rocketStruct: RocketStruct?) {
        self.rocketStruct = rocketStruct
        super.init(frame: frame, collectionViewLayout: InfoScreenCollectionView.configureLayout())
        delegate = self
        dataSource = self
        backgroundColor = .black
        register(ParametrsCell.self, forCellWithReuseIdentifier: ParametrsCell.identifier)
        register(LabelCell.self, forCellWithReuseIdentifier: LabelCell.identifier)
        roundCorners(corners: [.topLeft, .topRight], radius: 15)
        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoScreenCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 1 {
            return setupParametrsCell(indexPath: indexPath)
        } else {
            return setupLabelCell(indexPath: indexPath)
        }
    }

    func collectionView(_: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1 { // Настройка для collectionView
            return 4
        }
        return 1
    }

    func numberOfSections(in _: UICollectionView) -> Int { 8 }

    private func setupParametrsCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ParametrsCell.identifier, for: indexPath) as! ParametrsCell
        DispatchQueue.main.async {
            switch indexPath.row {
            case 0:
                cell.magnitude.text = "Высота, mt"
                cell.value.text = String(self.rocketStruct?.height.meters ?? 0)
            case 1:
                cell.magnitude.text = "Диаметр, mt"
                cell.value.text = String(self.rocketStruct?.diameter.meters ?? 0)
            case 2:
                cell.magnitude.text = "Масса, kg"
                cell.value.text = String(self.rocketStruct?.mass.kg ?? 0)
            case 3:
                cell.magnitude.text = "Нагрузка, kg"
                cell.value.text = String(self.rocketStruct?.payloadWeights.first?.kg ?? 0)
            default:
                cell.magnitude.text = "default"
                cell.value.text = "nil"
            }
        }
        return cell
    }

    private func setupLabelCell(indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: LabelCell.identifier, for: indexPath) as! LabelCell
        cell.cellId = indexPath.section
        cell.mainLabel = getMainLabelCell(indexPath: indexPath)
        cell.valueLabel = getValueLabel(indexPath: indexPath)
        return cell
    }
}
