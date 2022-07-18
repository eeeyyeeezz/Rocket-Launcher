//
//  InfoCollectionView.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import UIKit

class ParametrsCollectionView: UICollectionView {

  init(){
      let layout = UICollectionViewFlowLayout()
      layout.scrollDirection = .horizontal
      super.init(frame: .zero, collectionViewLayout: layout)
      delegate = self
      dataSource = self
      backgroundColor = nil
    register(InfoCollectionViewCell.self, forCellWithReuseIdentifier: InfoCollectionViewCell.identifier)
      translatesAutoresizingMaskIntoConstraints = false
    }

  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}

extension ParametrsCollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    3
  }

  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    let cell = dequeueReusableCell(withReuseIdentifier: InfoCollectionViewCell.identifier, for: indexPath) as! InfoCollectionViewCell
    JSONParser.parsData { array in
      DispatchQueue.main.async {
        switch indexPath.row {
        case 0:
          cell.magnitude.text = "Высота, mt"
          cell.value.text = String(array[0].height.meters ?? 0)
        case 1:
          cell.magnitude.text = "Диаметр, mt"
          cell.value.text = String(array[0].diameter.meters ?? 0)
        case 2:
          cell.magnitude.text = "Масса, kg"
          cell.value.text = String(array[0].mass.kg)
        default:
          cell.magnitude.text = "Default"
          cell.value.text = "nil"
        }
      }
    }
    return cell
  }

  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      return CGSize(width: 100, height: 100)
    }
}
