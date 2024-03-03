//
//  SettingViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit
import UIKit

class SettingViewController: UIViewController {
    private var dropdownMenu: DropdownMenu? // MARK: dropdown
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
        view.backgroundColor = UIColor(named: "backgroundColor")
        configureDrowDownMenu()
    }

    private func configureViewModel() {
        tableView.reloadData()
    }
    // MARK: dropdown
    func configureDrowDownMenu() {
        let dropdownButton = UIButton(type: .custom)
        dropdownButton.setTitle("Language", for: .normal)
        dropdownButton.setTitleColor(UIColor(named: "BlackWhite") , for: .normal)
        dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped(sender:)), for: .touchUpInside)

        let dropdownMenu = DropdownMenu(items: ["az", "en", "ru"])
        dropdownMenu.delegate = self
        dropdownMenu.isHidden = true
        view.addSubview(dropdownMenu)
        self.dropdownMenu = dropdownMenu

        let dropdownBarButtonItem = UIBarButtonItem(customView: dropdownButton)
        navigationItem.rightBarButtonItem = dropdownBarButtonItem
    }

    // MARK: dropdown
    @objc func dropdownButtonTapped(sender: UIButton) {
        guard let dropdownMenu = dropdownMenu else { return }
        dropdownMenu.isHidden = !dropdownMenu.isHidden

        if dropdownMenu.isHidden {
            dropdownMenu.removeFromSuperview()
        } else {
            if let superview = sender.superview, let navigationBar = navigationController?.navigationBar {
                let origin = CGPoint(x: navigationBar.frame.origin.x + navigationBar.frame.size.width - dropdownMenu.frame.size.width, y: navigationBar.frame.origin.y + navigationBar.frame.size.height)
                dropdownMenu.frame.origin = origin
                dropdownMenu.frame.size = CGSize(width: 100, height: 120)
                view.addSubview(dropdownMenu)
            }
        }
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
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemType = viewModel.settingItems[indexPath.row]
        viewModel.settingItemSafari(type: itemType)
        
    }
}

// MARK: dropdown
extension SettingViewController: DropdownMenuDelegate {
    func didSelectItem(item: String) {
        // Update the title of the dropdownButton
        if let customView = navigationItem.rightBarButtonItem?.customView as? UIButton {
            customView.setTitle(item, for: .normal)
        }
        // Remove the dropdownMenu from its superview
        dropdownMenu?.removeFromSuperview()
        // Handle any other logic related to the selected item
        print("Selected item: \(item)")
    }
}
