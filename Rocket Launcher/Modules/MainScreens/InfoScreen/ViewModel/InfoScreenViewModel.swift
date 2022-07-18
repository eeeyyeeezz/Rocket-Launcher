//
//  InfoScreenViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import Foundation

class InfoScreenViewModel {

  var rocketStruct: [RocketStruct]?

  init() {
    setupBinding()
  }

  func setupBinding() {
    JSONParser.parsData { result in
      self.rocketStruct = result
    }
  }

}
