//
//  ProductDetailedViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import UIKit

class ProductDetailedViewController: UIViewController{
    
    var viewModel = ProductDetailedViewModel()
    private lazy var  tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductDetailedCell.self, forCellReuseIdentifier: ProductDetailedCell.reuseID)
        tableView.register(ProductDetailedHeader.self, forHeaderFooterViewReuseIdentifier: "ProductDetailedHeader")
//        tableView.register(YourFooterViewClass.self, forHeaderFooterViewReuseIdentifier: "YourFooterIdentifier")

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
        viewModel.getSingleProduct()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            self.tableView.delegate = self
            self.tableView.dataSource = self
            self.tableView.reloadData()
        }
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


extension  ProductDetailedViewController:  UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ProductDetailedCell.reuseID, for: indexPath) as! ProductDetailedCell
        if let item = viewModel.singleProduct {
            cell.configure(item: item)
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProductDetailedHeader.reuseID) as! ProductDetailedHeader
        headerView.singleProduct = viewModel.singleProduct 
        return headerView
    }

//    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        let footerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "YourFooterIdentifier")
//        // Configure the footer view
//        return footerView
//    }

    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 200 // Set the desired height for your header
    }

//    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//        return 50 // Set the desired height for your footer
//    }
    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 500 // Set the desired height for your cells
//    }
}
