//
//  BasketViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class BasketViewController: UIViewController {

    var viewModel = BasketViewModel()
    
    lazy var table: UITableView = {
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.backgroundColor = .clear
        table.rowHeight = 130
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(BasketCell.self, forCellReuseIdentifier: BasketCell.reuseID)
        return table
    }()
    
    lazy var noItems: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BlackWhite") // black
        label.text = "Sebet Boshdur"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var totalPriceText: UILabel = {
        let label = UILabel()
        label.isHidden = true
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BlackWhite") // black
        label.text = "Sebet:"
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BlackWhite") // black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .medium)
        return label
    }()
    private lazy var checkOutButton: UIButton = {
        let button = UIButton(type: .system)
        button.isHidden = true
        button.setTitle("Check Out Et", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "UniversalColor")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(checkOutButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func checkOutButtonTapped() {
        viewModel.writeToBuilder()
        let coordinator = CheckOutCoordinator(builder: viewModel.builder,
                                              totalCheckOutPrice: viewModel.calculateTotalPrice(),
                                              navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
    
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
        viewModel.readBasketProductsFromFile { [weak self] in
            self?.configureVisibility()
            self?.table.reloadData()
            self?.totalPriceLabel.text = "\(String(describing: self?.viewModel.calculateTotalPrice() ?? 0.0)) AZN"
        }
    }
    
    func configureVisibility() {
        if viewModel.basketItemsfromFile.isEmpty {
            noItems.isHidden = false
            table.isHidden = true
            totalPriceText.isHidden = true
            totalPriceLabel.isHidden = true
            checkOutButton.isHidden = true
        } else {
            noItems.isHidden = true
            table.isHidden = false
            totalPriceText.isHidden = false
            totalPriceLabel.isHidden = false
            checkOutButton.isHidden = false
        }
    }

    
    func configureConstraint() {
        view.addSubview(table)
        view.addSubview(noItems)
        view.addSubview(checkOutButton)
        view.addSubview(totalPriceText)
        view.addSubview(totalPriceLabel)

        NSLayoutConstraint.activate([
            table.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            table.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            table.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            
            totalPriceText.topAnchor.constraint(equalTo: table.bottomAnchor, constant: 10),
            totalPriceText.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            totalPriceText.heightAnchor.constraint(equalToConstant: 20),
            
            totalPriceLabel.topAnchor.constraint(equalTo: table.bottomAnchor, constant: 10),
            totalPriceLabel.leadingAnchor.constraint(equalTo: totalPriceText.trailingAnchor, constant: 20),
            totalPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            checkOutButton.topAnchor.constraint(equalTo: totalPriceText.bottomAnchor, constant: 20),
            checkOutButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            checkOutButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            checkOutButton.heightAnchor.constraint(equalToConstant: 60),
            checkOutButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            
            noItems.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noItems.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            noItems.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            noItems.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
}

extension BasketViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.basketItemsfromFile.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: BasketCell.reuseID) as! BasketCell
        cell.configure(data: viewModel.basketItemsfromFile[indexPath.row])
        cell.backgroundColor = .clear
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let coordinator = ProductDetailedViewCoordinator(slug: viewModel.basketItemsfromFile[indexPath.row].slug ?? "", navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
    
   // MARK: Delete Process
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
            viewModel.basketItemsfromFile.remove(at: indexPath.item)
            let fileManager = FileManagerHelper()
            fileManager.writeDataToFile(data: viewModel.basketItemsfromFile, fileSelection: .basket)
            configureViewModel()
        }
    
}
