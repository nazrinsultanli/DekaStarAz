//
//  FilterDetailController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 06.02.24.
//


import UIKit

class FilterDetailController: UIViewController {

    var viewModel: FilterDetailViewModel?
    
    var didSelectCategory: ((String) -> Void)?
    
    private lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.rowHeight = 60
        table.register(FilterDetailListCell.self, forCellReuseIdentifier: FilterDetailListCell.reuseID)
        table.dataSource = self
        table.delegate = self
        return table
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
 
    
    private func configureUI() {
        title = viewModel?.filterType?.rawValue
        view.backgroundColor = .white
        
    }
    

    private func configureViewModel() {
        viewModel?.getfilterItems()
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
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)])
    }

}

extension FilterDetailController: UITableViewDataSource, UITableViewDelegate {
    //MARK: Table view for rest Items
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.filterItems.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FilterDetailListCell.reuseID, for: indexPath) as! FilterDetailListCell
        cell.configure(item: viewModel?.filterItems[indexPath.row].titleText ?? "")
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch viewModel?.filterType {
        case .category:
            viewModel?.filterBuilder?.category = viewModel?.filterItems[indexPath.row].slugId ?? ""
//            viewModel.selectedCategory = viewModel.filterItems[indexPath.row].slugId
            didSelectCategory?(viewModel?.filterItems[indexPath.row].slugId ?? "")
        case .collection:
            viewModel?.filterBuilder?.collection = viewModel?.filterItems[indexPath.row].slugId ?? ""
        case .brand:
            viewModel?.filterBuilder?.brand = viewModel?.filterItems[indexPath.row].slugId ?? ""
        default:
            break
        }
        navigationController?.popViewController(animated: true)
        
    }
}

