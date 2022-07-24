//
//  InfoScreenViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import RxCocoa

class InfoScreenViewModel {
    var rocketStruct = PublishRelay<[RocketStruct]>()

    var launchStruct = PublishRelay<[LaunchStruct]>()

    var output: Output?

    init() {
        setupBinding()
    }

    func setupBinding() {
        JSONParser.parsRocketData { [weak self] result in
            debugPrint("rocket pars")
            self?.rocketStruct.accept(result)
        }

        JSONParser.parsLaunchData { [weak self] result in
            debugPrint("launch pars")
            self?.launchStruct.accept(result)
        }
    }

    func setImage(backgroundCover: UIImageView, rocketStruct: [RocketStruct], rocketId: Int) {
        guard let url = URL(string: rocketStruct[rocketId].flickrImages[0]) else { return }

        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        backgroundCover.image = image
                    }
                }
            }
        }
    }

    struct Output {
        var rocketStruct: PublishRelay<[RocketStruct]>
    }
}
