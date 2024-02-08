//
//  FilterUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import Foundation
protocol FilterUseCase {
    func getFilteredPrododuct(categoryKey:String, 
                              collection:String,
                              inStock: Bool,
                              minPrice:String,
                              maxPrice:String,
                              language: String,
                              completion: @escaping((HomePageProductsModel?,String?) ->Void))
}
