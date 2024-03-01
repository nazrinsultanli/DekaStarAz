//
//  SearchManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 01.03.24.
//

import Foundation
class SearchManager: SearchUseCase {
    func getSearchItems(searchText: String, completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: SearchEndpoint.searchEndpoint.rawValue + searchText ,
                               completion: completion)
    }
    
   
    
}
