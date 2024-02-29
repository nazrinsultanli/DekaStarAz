//
//  SearchUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 01.03.24.
//

import Foundation
protocol SearchUseCase {
    func getHomeItems(endPoint: SearchEndpoint, completion: @escaping((HomePageProductsModel?,String?) ->Void))
    
}
