//
//  FavoriteViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var viewModel = FavoriteViewModel()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .yellow
//        table.separatorStyle = .none
        table.rowHeight = 250
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(FavoritePageCell.self, forCellReuseIdentifier: FavoritePageCell.reuseID)
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureConstraint()
        configureViewModel()
        
    }
    
    func configureViewModel() {
        viewModel.readFavoritesProductsFromFile { [weak self] in
            self?.table.reloadData()
        }
    }

    func configureConstraint() {
        view.addSubview(table)
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension FavoriteViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.favItemsfromFile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritePageCell.reuseID) as! FavoritePageCell
        cell.configure(data: viewModel.favItemsfromFile[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
                self.deleteData(at: indexPath)
            }
            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
            return swipeActions
        }

        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
            return true
        }

        func deleteData(at indexPath: IndexPath) {
            viewModel.favItemsfromFile.remove(at: indexPath.item)            
            let filemManager = FileManagerHelper()
            filemManager.writeDataToFile(products: viewModel.favItemsfromFile)
            configureViewModel()
        }
    
}




