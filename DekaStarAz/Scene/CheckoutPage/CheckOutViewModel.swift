//
//  CheckOutViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
class CheckOutViewModel {
    var builder: CheckoutBuilder?
    var totalCheckOutPrice: Double?
    var stateCheck: Bool?

    init(builder: CheckoutBuilder?, totalCheckOutPrice: Double, stateCheck: Bool? = true) {
        self.builder = builder
        self.totalCheckOutPrice = totalCheckOutPrice
        self.stateCheck = stateCheck
    }
}
