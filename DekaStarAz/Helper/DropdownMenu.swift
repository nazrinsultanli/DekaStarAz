//
//  DropdownMenu.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 23.02.24.
//

import Foundation
import UIKit
protocol DropdownMenuDelegate: AnyObject {
    func didSelectItem(item: String)
}

class DropdownMenu: UIView, UITableViewDataSource, UITableViewDelegate {
    weak var delegate: DropdownMenuDelegate?
    
    private let items: [String]
    private let tableView = UITableView()
    
    init(items: [String]) {
        self.items = items
        super.init(frame: .zero)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: topAnchor),
            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = items[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        delegate?.didSelectItem(item: items[indexPath.row])
        removeFromSuperview() // Close the dropdown menu
    }
}
