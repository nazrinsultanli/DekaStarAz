//
//  ProductsViewCoordinator.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
import UIKit
class ProductsViewCoordinator: Coordinator {
    var searchText: String?
    var categorySlugId: String?
    var homeItemsType: HomePageItemType?
    var navigationController: UINavigationController
    
    init(categorySlugId: String, 
         homeItemsType: HomePageItemType?,
         searchText: String?, 
         navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.categorySlugId = categorySlugId
        self.homeItemsType = homeItemsType
        self.searchText = searchText
    }
   
    func start() {
        let controller = ProductsViewController()
        controller.viewModel = .init(categorySlugId: categorySlugId ?? "",
                                     homeItemsType: homeItemsType,
                                     searchText: searchText)
        navigationController.show(controller, sender: nil)
    }
}
