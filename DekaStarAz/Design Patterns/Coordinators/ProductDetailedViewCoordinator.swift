//
//  ProductDetailedViewCoordinator.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
import UIKit
class ProductDetailedViewCoordinator: Coordinator {
    var slug: String?
    var navigationController: UINavigationController

    init(slug: String, navigationController: UINavigationController) {
        self.slug = slug
        self.navigationController = navigationController
    }
    func start() {
        let controller = ProductDetailedViewController()
        controller.viewModel = .init(slug: slug ?? "")
        navigationController.show(controller, sender: nil)
    }
}
