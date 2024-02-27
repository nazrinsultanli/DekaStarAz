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
    
    
    func addBasketProduct() {
        if let item = basketItem {
            basketItemsfromFile.append(item)
            fileHelper.writeDataToFile(data: basketItemsfromFile, fileSelection: .basket)
        }
    }
    
    func readBasketProductsFromFile (completion: @escaping () -> Void) {
        fileHelper.readDataFromFile(fileSelection: .basket) { (basketProducts: [ProductModel]?) in
            if let basketProducts = basketProducts {
                self.basketItemsfromFile = basketProducts
            } else {
                print("Failed to read basket products from file.")
            }
        }
        
    }
}
