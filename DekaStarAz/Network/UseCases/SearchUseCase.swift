//
//  SearchUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 01.03.24.
//

import Foundation
protocol SearchUseCase {
    func getSearchItems(searchText: String, completion: @escaping((HomePageProductsModel?,String?) ->Void))
    
}
