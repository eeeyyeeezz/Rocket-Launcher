//
//  InfoScreenViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import RxCocoa
import RxSwift

class InfoScreenViewModel {
    var rocketStruct = BehaviorRelay<[RocketStruct]>(value: [])

    var output: Output?

    init() {
        setupBinding()
    }

    func setupBinding() {
        JSONParser.parsData { result in
            self.rocketStruct.accept(result)
//      self.output?.rocketStruct.accept(result)
        }
    }

    struct Output {
        var rocketStruct: BehaviorRelay<[RocketStruct]>
    }
}
