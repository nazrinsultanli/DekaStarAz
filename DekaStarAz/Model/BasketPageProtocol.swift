//
//  BasketPageProtocol.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.02.24.
//

import Foundation
protocol BasketPageProtocol {
    var totalPriceBasket: String { get }
    var userQuantityBasket: Int { get }
    var productIDBasket: Int { get }
    var productQuantityTypeBasket: String { get }
    var photoLinkBasket: String { get }
    var modelNameBasket: String { get }
    var codeBasket: String { get }
    var originalPriceBasket: String { get }
    var discountedPriceBasket: String { get }
}
