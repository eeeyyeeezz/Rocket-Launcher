//
//  RocketsCollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class RocketsCollectionView: UICollectionView {

  var rocketStruct: [RocketStruct]!

  init(rocketStruct: [RocketStruct]){
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
    	layout.minimumLineSpacing = 10
    	layout.minimumInteritemSpacing = 10
      super.init(frame: .zero, collectionViewLayout: layout)
      delegate = self
      dataSource = self
      backgroundColor = nil
    	register(RocketsCollectionViewCell.self, forCellWithReuseIdentifier: RocketsCollectionViewCell.identifier)
      translatesAutoresizingMaskIntoConstraints = false
    }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension RocketsCollectionView: UICollectionViewDelegate,
                                 UICollectionViewDataSource,
																	UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: RocketsCollectionViewCell.identifier, for: indexPath) as! RocketsCollectionViewCell
    cell.frame = bounds
    switch indexPath.row {
    case 0:
      cell.infoView = InfoScreenView(frame: bounds, rocketStruct: rocketStruct[0])
    case 1:
      cell.infoView = InfoScreenView(frame: bounds, rocketStruct: rocketStruct[1])
    case 2:
      cell.infoView = InfoScreenView(frame: bounds, rocketStruct: rocketStruct[2])
    case 3:
      cell.infoView = InfoScreenView(frame: bounds, rocketStruct: rocketStruct[3])
    default:
      cell.infoView = nil
    }
    return cell
  }


}

