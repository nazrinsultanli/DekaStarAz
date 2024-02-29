//
//  SearchManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 01.03.24.
//

import Foundation
class SearchManager:SearchUseCase {
    func getHomeItems(endPoint: SearchEndpoint, completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: endPoint.rawValue,
                               completion: completion)
    }
    
    
}
