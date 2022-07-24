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

    func changeSwitchValue() {
        guard let cellId = cellId else {
            debugPrint("SettingsError")
            return
        }
        switch cellId {
        case 0:
            UserDefaults.standard.set("mt", forKey: ValueEnum.Height.mt.rawValue)
        default:
            break
        }

        debugPrint("switch \(cellId)")
    }
}
