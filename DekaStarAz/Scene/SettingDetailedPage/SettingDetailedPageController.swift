//
//  SettingDetailedPageController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import UIKit

class SettingDetailedPageController: UIViewController {
    var viewModel: SettingDetailViewModel?
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.separatorStyle = .none
        table.backgroundColor = .clear
        //MARK: problem----------------------
//        table.estimatedRowHeight = 500
//        table.rowHeight = UITableView.automaticDimension
        table.register(TopImageButtomLabelTableCell.self, forCellReuseIdentifier: TopImageButtomLabelTableCell.reuseID)
        table.register(ContactDataCell.self, forCellReuseIdentifier: ContactDataCell.reuseID)
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewModel()
        configureUI()
        configureConstraints()
    }
    private func configureUI() {
        title = viewModel?.settingType?.rawValue
        view.backgroundColor = .white
    }

    private func configureViewModel() {
        tableView.dataSource = self
        tableView.delegate = self
        viewModel?.getSettingItems()
        viewModel?.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel?.success =  {
            self.tableView.reloadData()
        }
    }

    private func configureConstraints() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])}
}

extension SettingDetailedPageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch viewModel?.settingType {
        case .contactData:
            let cell = tableView.dequeueReusableCell(withIdentifier: ContactDataCell.reuseID, for: indexPath) as! ContactDataCell
            if let item = viewModel?.settingItem{
                cell.configure(item: item)
            }
            
            return cell
        default:
            let cell = tableView.dequeueReusableCell(withIdentifier: TopImageButtomLabelTableCell.reuseID, for: indexPath) as! TopImageButtomLabelTableCell
            if let item = viewModel?.settingItem{
                cell.configure(item: item)
            }
            return cell
        }
    }
    //MARK: problem----------------------
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    //MARK: header view
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.width*2/3))
        headerView.backgroundColor = .brown
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: tableView.frame.width*2/3))
        imageView.loadImage(url: viewModel?.settingItem?.photoLink ?? "")
        imageView.contentMode = .scaleAspectFill
        headerView.addSubview(imageView)
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        tableView.frame.width*2/3
    }
}
