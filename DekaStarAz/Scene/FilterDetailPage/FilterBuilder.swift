//
//  FilterBuilder.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 10.02.24.
//

import Foundation

enum FilterItemsNames: String, CaseIterable {
    case category = "Kateqoriya"
    case collection = "Kolleksiya"
    case brand = "Brand"
    case inStock = "Movcuddur"
    case minPrice = "Minimum qiymet"
    case maxPrice = "Maximum qiymet"
}


struct FilterItemsStructModel {
    var category: String
    var collection: String
    var brand: String
    var inStock: Bool
    var minPrice: String
    var maxPrice: String
}
class FilterBuilder {
    var category: String?
    var collection: String?
    var brand: String?
    var inStock: Bool?
    var minPrice: String?
    var maxPrice: String?
    
    func build() -> FilterItemsStructModel {
        .init(category: category ?? "",
              collection: collection  ?? "",
              brand: brand  ?? "",
              inStock: inStock ?? true,
              minPrice: minPrice  ?? "",
              maxPrice: maxPrice  ?? "")
    }
}
