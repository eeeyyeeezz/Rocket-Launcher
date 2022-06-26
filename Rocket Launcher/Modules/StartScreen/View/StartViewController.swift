//
//  ViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class StartViewController: UIViewController {

  private lazy var backgroundCover: UIImageView = {
    let image = UIImageView(image: UIImage(named: "FalconHeavy"))
    image.contentMode = .scaleAspectFill
    image.frame = view.bounds
    return image
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(backgroundCover)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(true)
  }


}

