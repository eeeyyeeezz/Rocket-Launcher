//
//  InfoScreenViewModel.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 18.07.2022.
//

import RxCocoa
import RxSwift

class InfoScreenViewModel {
    var rocketStruct = PublishRelay<[RocketStruct]>()

    var output: Output?

    init() {
        setupBinding()
    }

    func setupBinding() {
        JSONParser.parsData { [weak self] result in
            self?.rocketStruct.accept(result)
//            self?.output = Output(rocketStruct: self!.rocketStruct)
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
