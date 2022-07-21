//
//  Layout.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 21.07.2022.
//

import UIKit

extension InfoScreenCollectionView {
    static func configureLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, env) -> NSCollectionLayoutSection? in
          if sectionNumber == 1 { // Ячейка с collectionView
            return createCollectionViewLayout()
          } else { // Ячейка с лейблами
            return createBasicLayout()
          }
        }
    }

  private static func createCollectionViewLayout() -> NSCollectionLayoutSection? {
    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(0.3),
                                                        heightDimension: .fractionalHeight(0.2)))
    item.contentInsets.trailing = 20
    item.contentInsets.bottom = 16
    let group = NSCollectionLayoutGroup.horizontal(layoutSize:
        .init(widthDimension:
            .fractionalWidth(1),
            heightDimension: .estimated(500)),
            subitems: [item])
    group.contentInsets.leading = 10
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    return section
  }

  private static func createBasicLayout() -> NSCollectionLayoutSection? {
    let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1),
                                                        heightDimension: .fractionalHeight(1)))
    item.contentInsets.bottom = 16
    let group = NSCollectionLayoutGroup.horizontal(layoutSize:
        .init(widthDimension:
        .fractionalWidth(1),
        heightDimension: .fractionalHeight(0.2)), subitems: [item])
    group.contentInsets.leading = 5
    let section = NSCollectionLayoutSection(group: group)
    section.orthogonalScrollingBehavior = .continuous
    return section
  }


}
