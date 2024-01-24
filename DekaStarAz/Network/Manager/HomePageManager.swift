//
//  HomePageManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation

class HomePageManager: BannerListUseCase, CategoryUseCase, HomeItemUseCase {
    func getHomeItems(endPoint: HomeItemsEndpoint, completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: endPoint.rawValue,
                               completion: completion)
    }
    

    
    func getCategoryList(completion: @escaping ((CategoryModel?, String?) -> Void)) {
        NetworkManager.request(model: CategoryModel.self,
                               url: CategoryEndpoint.categoryEndpoint.rawValue,
                               completion: completion)
    }
    
    
    func getBannerList(completion: @escaping (([BannerModel]?, String?) -> Void)) {
        NetworkManager.request(model: [BannerModel].self,
                               url: BannerEndpoint.bannerEndpoint.rawValue,
                               completion: completion)
    }
    
    
}
