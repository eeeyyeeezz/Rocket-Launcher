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
    1
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: RocketsCollectionViewCell.identifier, for: indexPath) as! RocketsCollectionViewCell
    cell.frame = bounds
    if indexPath.row < rocketStruct.count {
      cell.infoView = InfoScreenView(frame: bounds, rocketStruct: rocketStruct[indexPath.row])
    }
    return cell
  }


}

