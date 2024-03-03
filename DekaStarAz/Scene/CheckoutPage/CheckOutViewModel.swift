//
//  CheckOutViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.03.24.
//

import Foundation
class CheckOutViewModel {
    var builder: CheckoutBuilder?
    var totalCheckOutPrice: Double = 0.0
    var stateCheck = true
    
    init(builder: CheckoutBuilder? = nil, totalCheckOutPrice: Double, stateCheck: Bool) {
        self.builder = builder
        self.totalCheckOutPrice = totalCheckOutPrice
        self.stateCheck = stateCheck
    }
}
