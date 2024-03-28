//
//  FilterPageController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 05.02.24.
//
import UIKit

class FilterPageController: UIViewController {
    var viewModel = FilterViewModel()
    var filterBuilder = FilterBuilder()
    var filterCompleted: ((FilterItemsStructModel) -> Void)?
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = .clear
        tableView.register(FilterPageTitleTextfieldCell.self, forCellReuseIdentifier: FilterPageTitleTextfieldCell.reuseID)
        tableView.register(FilterPagaCell.self, forCellReuseIdentifier: FilterPagaCell.reuseID)
        tableView.register(FilterPageTitleButtonCell.self, forCellReuseIdentifier: FilterPageTitleButtonCell.reuseID)
        return tableView
    }()
    
    private lazy var tamamlaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tamamla", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(named: "UniversalColor")
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(tamamlaButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.titleLabel?.font = UIFont.systemFont(ofSize: 20) // Set font size to 16
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureViewModel()
        self.hideKeyboardWhenTappedAround()
    }
    
    private func configureUI() {
        title = "Filter"
        view.backgroundColor = UIColor(named: "backgroundColor")
    }
    private func configureViewModel() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.reloadData()
    }
    
    private func configureConstraints() {
        view.addSubview(tableView)
        view.addSubview(tamamlaButton)
        
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: tamamlaButton.topAnchor),
            
            tamamlaButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            tamamlaButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            tamamlaButton.heightAnchor.constraint(equalToConstant: 60),
            tamamlaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
        ])
    }
    
    @objc func tamamlaButtonTapped() {
        filterCompleted?(filterBuilder.build())
        navigationController?.popViewController(animated: true)
    }
}

extension FilterPageController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.filterItems.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let itemType = viewModel.filterItems[indexPath.item]
        switch itemType {
        case .category:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterPagaCell.reuseID, for: indexPath)as! FilterPagaCell
            cell.configure(item: itemType.rawValue)
            cell.backgroundColor = .clear
            return cell
        case .collection:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterPagaCell.reuseID, for: indexPath)as! FilterPagaCell
            cell.configure(item: itemType.rawValue)
            cell.backgroundColor = .clear
            return cell
        case .brand:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterPagaCell.reuseID, for: indexPath) as! FilterPagaCell
            cell.configure(item: itemType.rawValue)
            cell.backgroundColor = .clear
            return cell
        case .inStock:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterPageTitleButtonCell.reuseID, for: indexPath) as! FilterPageTitleButtonCell
            cell.configure(item: itemType.rawValue)
            cell.filterBuilder = filterBuilder
            cell.backgroundColor = .clear
            return cell
        case .minPrice:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterPageTitleTextfieldCell.reuseID, for: indexPath) as! FilterPageTitleTextfieldCell
            cell.configure(item: itemType.rawValue, itemType: itemType)
            cell.filterBuilder = filterBuilder
            cell.backgroundColor = .clear
            return cell
        case .maxPrice:
            let cell = tableView.dequeueReusableCell(withIdentifier: FilterPageTitleTextfieldCell.reuseID, for: indexPath) as! FilterPageTitleTextfieldCell
            cell.configure(item: itemType.rawValue, itemType: itemType)
            cell.filterBuilder = filterBuilder
            cell.backgroundColor = .clear
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemType = viewModel.filterItems[indexPath.row]
        switch itemType {
        case .category:
            let coordinator = FilterDetailViewCoordinator(filterBuilder: filterBuilder,
                                                          filterType: itemType,
                                                          navigationController:navigationController ?? UINavigationController())
            coordinator.start()
        case .collection:
            let coordinator = FilterDetailViewCoordinator(filterBuilder: filterBuilder,
                                                          filterType: itemType,
                                                          navigationController: navigationController ?? UINavigationController())
            coordinator.start()
        case .brand:
            let coordinator = FilterDetailViewCoordinator(filterBuilder: filterBuilder,
                                                          filterType: itemType,
                                                          navigationController: navigationController ?? UINavigationController())
            coordinator.start()
        default:
            break
        }
    }
}
