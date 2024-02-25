//
//  SettingViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit
import UIKit

class SettingViewController: UIViewController {
    var viewModel = SettingViewModel()
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(TitleWithDisclosureTableCell.self, forCellReuseIdentifier: TitleWithDisclosureTableCell.reuseID)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureViewModel()
    }

    private func configureUI() {
        title = "Daha cox"
        view.backgroundColor = .white
    }

    private func configureViewModel() {
        tableView.reloadData()
    }

    private func configureConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
}

extension SettingViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.settingItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: TitleWithDisclosureTableCell.reuseID, for: indexPath) as! TitleWithDisclosureTableCell
        let itemType = viewModel.settingItems[indexPath.row]
        cell.configure(item: itemType.rawValue)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemType = viewModel.settingItems[indexPath.row]
        let controller = SettingDetailedPageController()
        controller.viewModel = .init(settingType: itemType)
        navigationController?.show(controller, sender: nil)
    }
}

