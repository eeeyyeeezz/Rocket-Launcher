//
//  SettingsScreenViewController.swift
//  Rocket Launcher
//
//  Created by Daniil Varavin on 26.06.2022.
//

import UIKit

class SettingsViewController: UITableViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBinding()
    }

    private func setupBinding() {
        title = "Настройки"
        tableView.delegate = self
        tableView.dataSource = self
        tableView.backgroundColor = .black
        navigationController?.navigationBar.tintColor = UIColor.white
        navigationController?.navigationBar.barTintColor = UIColor.black
        tableView.register(SettingsCell.self, forCellReuseIdentifier: SettingsCell.identifier)
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SettingsCell.identifier, for: indexPath) as! SettingsCell
        switch indexPath.row {
        case 0:
            cell.valueLabel.text = "Высота"
        case 1:
            cell.valueLabel.text = "Диаметр"
        case 2:
            cell.valueLabel.text = "Масса"
        case 3:
            cell.valueLabel.text = "Полезная нагрузка"
        default:
            cell.valueLabel.text = "defaul"
        }
        cell.cellId = indexPath.row
        return cell
    }

    override func tableView(_: UITableView, numberOfRowsInSection _: Int) -> Int { 4 }

    override func tableView(_: UITableView, heightForRowAt _: IndexPath) -> CGFloat { 100 }
}
