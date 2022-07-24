//
//  LaunchCellViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 24.07.2022.
//

import Foundation

class LaunchCellViewModel {
    private let cellId: Int

    private let launchStructArray: [LaunchStruct]

    init(launchStructArray: [LaunchStruct], cellId: Int) {
        self.cellId = cellId
        self.launchStructArray = launchStructArray
    }

    func getLaunchStruct() -> LaunchStruct {
  		launchStructArray[cellId]
    }
}
