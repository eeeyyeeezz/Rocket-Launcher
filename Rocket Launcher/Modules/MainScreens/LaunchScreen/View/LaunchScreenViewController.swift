//
//  LaunchScreenViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class LaunchScreenViewController: UITableViewController {

    private let rocketStruct: RocketStruct?

    private let rocketName: String

    init(rocketStruct: RocketStruct?, rocketName: String) {
        self.rocketName = rocketName
        self.rocketStruct = rocketStruct
        super.init(nibName: nil, bundle: nil)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
		setupBinding()
    }

    private func setupBinding() {
        title = rocketName
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        tableView.register(LaunchCell.self, forCellReuseIdentifier: LaunchCell.identifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: LaunchCell.identifier, for: indexPath) as! LaunchCell
        return cell
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 10 }

    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat { 100 }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class LaunchCell: UITableViewCell {

    static let identifier = "LaunchCell"

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
