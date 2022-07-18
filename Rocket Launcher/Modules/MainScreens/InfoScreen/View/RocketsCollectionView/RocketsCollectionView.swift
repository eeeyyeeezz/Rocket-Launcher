//
//  RocketsCollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class RocketsCollectionView: UICollectionView {

  let rocketStruct: [RocketStruct]

  init(rocketStruct: [RocketStruct]){
    	self.rocketStruct = rocketStruct
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
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

extension RocketsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    4
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: RocketsCollectionViewCell.identifier, for: indexPath) as! RocketsCollectionViewCell
    return cell
  }


}

