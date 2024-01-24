//
//  HomeItemUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

protocol HomeItemUseCase {
    func getHomeItems(endPoint: HomeItemsEndpoint, completion: @escaping((HomePageProductsModel?,String?) ->Void))
    
}
