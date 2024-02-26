//
//  BasketViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class BasketViewController: UIViewController {

    var viewModel = BasketViewModel()
    var builder = CheckoutBuilder()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.rowHeight = 100
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(BasketCell.self, forCellReuseIdentifier: BasketCell.reuseID)
        return table
    }()
    
    lazy var noItems: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "Secilmishler"
        view.backgroundColor = .white
        configureConstraint()
        configureViewModel()
        
    }
    
    func configureViewModel() {
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configureVisibility()
    }
    
    func configureVisibility() {
//        if viewModel.favItemsfromFile.isEmpty {
//            noItems.isHidden = false
//            table.isHidden = true
//        } else {
//            noItems.isHidden = true
//            table.isHidden = false
//        }
    }

    func configureConstraint() {
        view.addSubview(table)
        view.addSubview(noItems)
//
//        noItems.isHidden = viewModel.favItemsfromFile.isEmpty ? false :  true
//        table.isHidden = viewModel.favItemsfromFile.isEmpty ? true :  false
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

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        builder.cartItems?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.reuseID) as! BasketCell
        if let item = builder.cartItems?[indexPath.row] {
            cell.configure(data: item)
        }
       
        return cell
    }
    
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let controller = ProductDetailedViewController()
//        controller.viewModel.slug = viewModel.favItemsfromFile[indexPath.row].slug
//        navigationController?.show(controller, sender: nil)
//    }
//    
    //MARK: Delete Process
//    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
//            let deleteAction = UIContextualAction(style: .destructive, title: "Delete") {  (contextualAction, view, boolValue) in
//                self.deleteData(at: indexPath)
//            }
//            let swipeActions = UISwipeActionsConfiguration(actions: [deleteAction])
//            return swipeActions
//        }
//
//        func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
//            return true
//        }
//
//        func deleteData(at indexPath: IndexPath) {
//            viewModel.favItemsfromFile.remove(at: indexPath.item)
//            let filemManager = FileManagerHelper()
//            filemManager.writeDataToFile(products: viewModel.favItemsfromFile)
//            configureViewModel()
//        }
    
}




