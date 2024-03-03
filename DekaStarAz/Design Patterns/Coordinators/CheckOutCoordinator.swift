//
//  CheckOutCoordinator.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
import UIKit
class CheckOutCoordinator: Coordinator {
    var builder: CheckoutBuilder?
    var totalCheckOutPrice: Double?
    var stateCheck: Bool?
    var navigationController: UINavigationController

    init(builder: CheckoutBuilder?, totalCheckOutPrice: Double, stateCheck: Bool? = true,  navigationController: UINavigationController) {
        self.builder = builder
        self.totalCheckOutPrice = totalCheckOutPrice
        self.stateCheck = stateCheck
        self.navigationController = navigationController
    }

    func start() {
        let controller = CheckOutViewController()
        controller.viewModel = .init(builder: builder, totalCheckOutPrice: totalCheckOutPrice ?? 0.0)
        navigationController.show(controller, sender: nil)
    }
}
