//
//  FavoriteViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class FavoriteViewController: UIViewController {
    
    var viewModel: FavoriteViewModel?
    
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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        viewModel?.readFavoritesProductsFromFile()
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
        viewModel?.favItemsfromFile.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FavoritePageCell.reuseID) as! FavoritePageCell
        if let item = viewModel?.favItemsfromFile[indexPath.row] {
            cell.configure(data: item)
        }
        return cell
    }

}




