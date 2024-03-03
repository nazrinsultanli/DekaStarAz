//
//  CheckoutBuilder.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.02.24.
//

import Foundation
class CheckoutBuilder {
    var cartItems = [CartModel]()
    var name: String?
    var phone: String?
    var address: String?
    var termsAgreed: Bool?

    func chekoutBuild() -> [String: Any]{
        [ "name": name ?? "",
          "phone": phone ?? "",
          "address": address ?? "",
          "terms_agreed": termsAgreed ?? false,
          "cart": cartItems.map{ $0.toDictionary()}
        ]
    }
}

