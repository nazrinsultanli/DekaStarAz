//
//  FilterDetailViewCoordinator.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
import UIKit
class FilterDetailViewCoordinator: Coordinator {
    var filterBuilder: FilterBuilder?
    var filterType: FilterItemsNames?
    var navigationController: UINavigationController
    
    init(filterBuilder: FilterBuilder, filterType: FilterItemsNames,  navigationController: UINavigationController) {
        self.filterBuilder = filterBuilder
        self.filterType = filterType
        self.navigationController = navigationController
    }

    func start() {
        var controller = UIViewController()
        if let filterBuilder = filterBuilder, let filterType = filterType {
            controller = FilterDetailController(viewModel: .init(filterBuilder: filterBuilder, filterType: filterType)) { category in
                self.filterBuilder?.selectedCategory = category
            }
        }
        navigationController.show(controller, sender: nil)
    }
}
