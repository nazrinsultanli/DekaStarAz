//
//  FilterViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 05.02.24.
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


class FilterViewModel {
    var filterItems: [FilterItemsNames] = FilterItemsNames.allCases
        
}
