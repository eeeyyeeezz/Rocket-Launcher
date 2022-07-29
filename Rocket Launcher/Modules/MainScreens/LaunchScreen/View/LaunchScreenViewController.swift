//
//  LaunchScreenViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import RxRelay
import RxSwift
import UIKit

class LaunchScreenViewController: UITableViewController {
    var launchStructArray = [LaunchStruct]()

    private let rocketName: String

    init(launchStruct: [LaunchStruct], rocketName: String) {
        self.rocketName = rocketName
        super.init(nibName: nil, bundle: nil)
        parsLaunchStruct(launchStructArray: launchStruct)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isTranslucent = true
    }

    private func parsLaunchStruct(launchStructArray: [LaunchStruct]) {
        launchStructArray.forEach { element in
            if element.rocket.rawValue == "5e9d0d95eda69955f709d1eb", rocketName == "Falcon 1" {
                self.launchStructArray.append(element)
            } else if element.rocket.rawValue == "5e9d0d95eda69973a809d1ec", rocketName == "Falcon 9" {
                self.launchStructArray.append(element)
            } else if element.rocket.rawValue == "5e9d0d95eda69974db09d1ed", rocketName == "Falcon ceHeavy" {
                self.launchStructArray.append(element)
            }
        }
    }

    private func setupBinding() {
        title = rocketName
        tableView.delegate = self
        tableView.dataSource = self
        view.backgroundColor = .black
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        tableView.register(LaunchCell.self, forCellReuseIdentifier: LaunchCell.identifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchCell.identifier, for: indexPath) as! LaunchCell
        cell.viewModel = LaunchCellViewModel(launchStructArray: launchStructArray, cellId: indexPath.row)
        return cell
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int { launchStructArray.count }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat { UIScreen.main.bounds.height / 6 }

    @available(*, unavailable)
    required init?(coder _: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
