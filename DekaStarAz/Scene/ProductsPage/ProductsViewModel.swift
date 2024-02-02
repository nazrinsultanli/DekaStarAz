//
//  ProductsViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import Foundation

class ProductsViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    var product: HomePageProductsModel?
    var productsItems = [HomeProductResult]()
    
    
    func getItems(type: HomePageItemType) {
        switch type {
        case .discounted:
            manager.getHomeItems(endPoint: HomeItemsEndpoint.recentEndpoint){ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.product = data
                    self.productsItems.append(contentsOf:data.results ?? [])
                    self.success?()
                }
            }
        case .recent:
            manager.getHomeItems(endPoint: HomeItemsEndpoint.discountedEndpoint){ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.product = data
                    self.productsItems.append(contentsOf:data.results ?? [])
                    self.success?()
                }
            }
        case .category:
            break
        }

    }
    
}
