//
//  CheckOutSuccessCoordinator.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
import UIKit
class CheckOutSuccessCoordinator: Coordinator {
    var builder: CheckoutBuilder?
    var navigationController: UINavigationController

    init(builder: CheckoutBuilder?, navigationController: UINavigationController) {
        self.builder = builder
        self.navigationController = navigationController
    }

    func start() {
        let controller = CheckOutSuccessPageViewController()
        controller.viewModel = .init(builder: builder)
        navigationController.show(controller, sender: nil)
    }
}
