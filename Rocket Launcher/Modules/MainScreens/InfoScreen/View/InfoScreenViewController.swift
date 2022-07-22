//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import RxSwift
import UIKit

class InfoScreenViewController: UIViewController {

    private let viewModel = InfoScreenViewModel()

    private let disposeBag = DisposeBag()

    private let rocketId: Int

    private var rocketStruct: [RocketStruct] = []

    private var infoScreenView: InfoScreenCollectionView!

    private lazy var backgroundCover: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        image.frame = view.frame
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()

    init(rocketId: Int) {
        self.rocketId = rocketId
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        view.backgroundColor = .black
        viewModel.rocketStruct.asObservable().subscribe(onNext: { result in
            self.rocketStruct = result
            DispatchQueue.main.async {
            	self.addConstraints()
            }
        }).disposed(by: disposeBag)


    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        .portrait
    }

 	 private func addConstraints() {
        infoScreenView = InfoScreenCollectionView(frame: view.frame, rocketStruct: rocketStruct[rocketId])
        view.addSubview(infoScreenView)
        NSLayoutConstraint.activate([
            infoScreenView.topAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
            infoScreenView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            infoScreenView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            infoScreenView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])

        setImage()
        view.addSubview(backgroundCover)
        NSLayoutConstraint.activate([
            backgroundCover.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundCover.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            backgroundCover.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            backgroundCover.bottomAnchor.constraint(equalTo: infoScreenView.topAnchor),
 		])
         view.bringSubviewToFront(infoScreenView)
    }

    private func setImage() {
        let randomId = Int.random(in: 0...rocketStruct[rocketId].flickrImages.count - 1)
        guard let url = URL(string: rocketStruct[rocketId].flickrImages[randomId]) else { return }

        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.backgroundCover.image = image
                    }
                }
            }
        }
    }

    required init?(coder aDecoder: NSCoder) {
		self.rocketId = 0
		super.init(coder: aDecoder)
    }

}
