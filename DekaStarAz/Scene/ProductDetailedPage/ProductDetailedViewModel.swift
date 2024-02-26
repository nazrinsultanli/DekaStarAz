//
//  ProductDetailedViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import Foundation

class ProductDetailedViewModel {
    private let manager = ProductManager()
    var slug: String?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var singleProduct: ProductModel?
//    var productQuantity: Int = 0
    
    func getSingleProduct () {
        manager.getPrododuct(slug: slug ?? "", language: "az") { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.singleProduct = data
                self.success?()
            }
        }
    }

//     func updateCartQuantity(_ productQuantity: Int) {
//         self.productQuantity = productQuantity
//     }
    
}
