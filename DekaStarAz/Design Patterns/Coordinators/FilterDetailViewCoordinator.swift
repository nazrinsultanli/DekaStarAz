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
        let controller = FilterDetailController()
        if let builder = filterBuilder, let fType = filterType {
            controller.viewModel = .init(filterBuilder: builder, filterType: fType)
        }
//        controller.viewModel = .init(filterBuilder: filterBuilder ?? nil, filterType: filterType ?? nil)
        navigationController.show(controller, sender: nil)
    }
}
