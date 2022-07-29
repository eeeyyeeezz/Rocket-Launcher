//
//  SettingsCellViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 23.07.2022.
//

import Foundation

class SettingsCellViewModel {
    private let cellId: Int?

    init(cellId: Int?) {
        self.cellId = cellId
    }

    func getValueParametrs() -> [String] {
      guard let cellId = cellId else { return [] }
      var array = [String]()
      array = cellId > 1 ? ["kg", "lb"] : ["mt", "ft"]
      return array
    }

    func changeSwitchValue() {
      guard let cellId = cellId else { return }
      debugPrint("switch \(cellId)")
    }
}
