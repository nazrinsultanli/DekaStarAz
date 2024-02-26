//
//  CheckoutModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.02.24.
//

import Foundation


// MARK: - checkout
struct CheckoutModel: Codable {
    let name, phone, address: String?
    let termsAgreed: Bool?
    let cart: [CartModel]?

    enum CodingKeys: String, CodingKey {
        case name, phone, address
        case termsAgreed = "terms_agreed"
        case cart
    }
}

// MARK: - Cart
struct CartModel: Codable {
    let price: String?
    let quantity, productID: Int?
    let productQuantityType: String?

    enum CodingKeys: String, CodingKey {
        case price, quantity
        case productID = "product_id"
        case productQuantityType = "product_quantity_type"
    }
}

enum ProductUnit: String, Codable {
    case numer = "NUMBER"
    case box = "BOX"
    case squareMeter = "SQUARE_METER"
}
