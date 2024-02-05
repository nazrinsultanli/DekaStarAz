//
//  FilterViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 05.02.24.
//

import Foundation

enum filterItemsNames: String, CaseIterable {
    case category = "Kateqoriya"
    case collection = "Kolleksiya"
    case inStock = "Movcuddur"
    case minPrice = "Minimum qiymet"
    case maxPrice = "Maximum qiymet"
}


struct FilterViewModel {
    var filterItems: [filterItemsNames] = filterItemsNames.allCases
        
}
