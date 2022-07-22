//
//  LaunchScreenViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class LaunchScreenViewController: UITableViewController {

    let rocketStruct: RocketStruct?

    init(rocketStruct: RocketStruct?) {
        self.rocketStruct = rocketStruct
        super.init(nibName: nil, bundle: nil)
        tableView.delegate = self
        tableView.dataSource = self
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int { 10 }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { 3 }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        cell.backgroundColor = .orange
        cell.textLabel!.text = "foo"
        return cell
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
