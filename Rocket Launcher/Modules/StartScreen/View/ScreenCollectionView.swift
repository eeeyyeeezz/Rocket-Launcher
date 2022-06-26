//
//  CollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class ScreenCollectionView: UICollectionView {

  init(){
    let layout = UICollectionViewFlowLayout()
    layout.scrollDirection = .horizontal
    super.init(frame: .zero, collectionViewLayout: layout)
    register(ScreenCollectionViewCell.self,
             forCellWithReuseIdentifier: ScreenCollectionViewCell.identifier)
    
    delegate = self
    dataSource = self
    backgroundColor = nil
    translatesAutoresizingMaskIntoConstraints = false
  }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension ScreenCollectionView: UICollectionViewDelegate,
                                UICollectionViewDataSource,
                                UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int { 4 }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: ScreenCollectionViewCell.identifier, for: indexPath) as! ScreenCollectionViewCell
    switch indexPath.row {
    case 0:
      cell.customView = InfoScreenViewController(frame: collectionView.bounds)
    default:
      cell.customView = UIView()
    }
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    CGSize(width: frame.width, height: frame.height)
  }

}
