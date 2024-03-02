//
//  CategoryViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 28.01.24.
//

import Foundation

class CategoryViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var categoryItems = [HomePagesItemsProtocols]()
  
    func getCategoryItem() {
        manager.getCategoryList { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.categoryItems.append(contentsOf: data)
                self.success?()
            }
        }
    }
}
