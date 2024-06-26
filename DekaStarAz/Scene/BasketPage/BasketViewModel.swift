//
//  BasketViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.02.24.
//

import Foundation

class BasketViewModel {
    var basketItem: ProductModel?
    var basketItemsfromFile = [ProductModel]()
    let fileHelper = FileManagerHelper()
    var builder = CheckoutBuilder()
    
    
    func readBasketProductsFromFile (completion: @escaping () -> Void) {
        fileHelper.readDataFromFile(fileSelection: .basket) { (basketProducts: [ProductModel]?) in
            if let basketProducts = basketProducts {
                self.basketItemsfromFile = basketProducts
                completion()
            } else {
                print("Failed to read basket products from file.")
            }
        }
    }
    func writeToBuilder() {
        for basketItem in basketItemsfromFile {
            let eachItem = CartModel(price: basketItem.discountPrice,
                                     quantity: basketItem.userQuantity,
                                     productID: basketItem.id,
                                     productQuantityType: basketItem.quantityType)
            builder.cartItems.append(eachItem)
        }
    }
    
    func calculateTotalPrice() -> Double {
        var totalCheckOutPrice: Double = 0.0
        for basketItem in basketItemsfromFile {
            var total: Double = 0.0
            if let price =  Double(basketItem.discountPrice ?? "0.0") {
                let quantity = Double(basketItem.userQuantity ?? 0)
                total = quantity * price
            }
            totalCheckOutPrice += total
        }
        return totalCheckOutPrice
    }
}
