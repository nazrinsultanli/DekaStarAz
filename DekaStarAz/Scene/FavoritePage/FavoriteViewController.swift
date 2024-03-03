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
        table.backgroundColor = .clear
        table.rowHeight = 100
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(FavoritePageCell.self, forCellReuseIdentifier: FavoritePageCell.reuseID)
        return table
    }()
    
    lazy var noItems: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BlackWhite") // black
        label.text = "Sevilenler qutusu Boshdur"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Secilmishler"
        view.backgroundColor = UIColor(named: "backgroundColor")
        configureConstraint()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureViewModel()
    }
    
    func configureViewModel() {
        viewModel.readFavoritesProductsFromFile { [weak self] in
            self?.table.reloadData()
            self?.configureVisibility()
        }
    }
    
    func configureVisibility() {
        if viewModel.favItemsfromFile.isEmpty {
            noItems.isHidden = false
            table.isHidden = true
        } else {
            noItems.isHidden = true
            table.isHidden = false
        }
    }

    func configureConstraint() {
        view.addSubview(table)
        view.addSubview(noItems)
        
        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            noItems.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noItems.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            noItems.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            noItems.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
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
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {        
        let coordinator = ProductDetailedViewCoordinator(slug: viewModel.favItemsfromFile[indexPath.row].slug ?? "", navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
    //MARK: Delete Process
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
            let fileManager = FileManagerHelper()
            fileManager.writeDataToFile(data: viewModel.favItemsfromFile, fileSelection: .favorite)
            configureViewModel()
        }
    
}




