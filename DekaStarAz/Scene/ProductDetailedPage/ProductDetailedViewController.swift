//
//  ProductDetailedViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import UIKit

class ProductDetailedViewController: UIViewController {
    var viewModel = ProductDetailedViewModel()
    private lazy var  tableView: UITableView = {
           let tableView = UITableView()
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
           return tableView
       }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
 
    
    private func configureUI() {
        title = "Products"
        view.backgroundColor = .systemGray4
        
    }
    private func configureViewModel() {
//        if let homeItemsType = homeItemsType {
//            viewModel.getItems(type: homeItemsType)
//        }
//        viewModel.error = { errorMessage in
//            print("Error:\(errorMessage)")
//        }
//        viewModel.success =  {
//            self.collectionView.delegate = self
//            self.collectionView.dataSource = self
//            self.collectionView.reloadData()
//        }
    }

    private func configureConstraints() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
    }

}
