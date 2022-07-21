//
//  InfoScreenCollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 21.07.2022.
//

import UIKit

class InfoScreenCollectionView: UICollectionView {

    init(frame: CGRect) {
        super.init(frame: frame, collectionViewLayout: InfoScreenCollectionView.configureLayout())
        delegate = self
        dataSource = self
        register(InfoScreenCollectionViewCell.self, forCellWithReuseIdentifier: InfoScreenCollectionViewCell.identifier)
        translatesAutoresizingMaskIntoConstraints = false
    }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension InfoScreenCollectionView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    if section == 1 { // Настройка для collectionView
      return 4
    }
    return 1
  }

  func numberOfSections(in collectionView: UICollectionView) -> Int {
    10
  }

  func collectionView(_: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: InfoScreenCollectionViewCell.identifier, for: indexPath) as! InfoScreenCollectionViewCell
    if indexPath.section == 1 {
      cell.backgroundColor = .red
    } else {
      cell.backgroundColor = .white
    }
    return cell
  }

}
