//
//  InfoCollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class ParametrsCollectionView: UICollectionView {
    let rocketStruct: RocketStruct?

    init(rocketStruct: RocketStruct?) {
        self.rocketStruct = rocketStruct
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        super.init(frame: .zero, collectionViewLayout: layout)
        delegate = self
        dataSource = self
        backgroundColor = nil
        register(ParametrsCollectionViewCell.self, forCellWithReuseIdentifier: ParametrsCollectionViewCell.identifier)
        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ParametrsCollectionView: UICollectionViewDelegate,
    UICollectionViewDataSource,
    UICollectionViewDelegateFlowLayout
{
    func collectionView(_: UICollectionView, numberOfItemsInSection _: Int) -> Int {
        4
    }

    func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: ParametrsCollectionViewCell.identifier, for: indexPath) as! ParametrsCollectionViewCell
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

    func collectionView(_: UICollectionView, layout _: UICollectionViewLayout, sizeForItemAt _: IndexPath) -> CGSize {
        return CGSize(width: 100, height: 100)
    }
}
