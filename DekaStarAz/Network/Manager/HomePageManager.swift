//
//  HomePageManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation

class HomePageManager: BannerListUseCase, CategoryUseCase, HomeItemUseCase,  FilterUseCase {
    func getFilteredPrododuct(categoryKey: String, 
                              collection: String,
                              inStock: Bool,
                              minPrice: String,
                              maxPrice: String,
                              language: String,
                              completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        let filterUrl = ProductEndpoint.filterEndpoint.rawValue + "?category=" + categoryKey  + "&" + NetworkHelperLinker.language + language
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: filterUrl,
                               completion: completion)
    }
    


    func getHomeItems(endPoint: HomeItemsEndpoint, completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: endPoint.rawValue,
                               completion: completion)
    }
    

    
    func getCategoryList(completion: @escaping (([CategoryModel]?, String?) -> Void)) {
        NetworkManager.request(model: [CategoryModel].self,
                               url: CategoryEndpoint.categoryEndpoint.rawValue,
                               completion: completion)
    }
    
    
    func getBannerList(completion: @escaping (([BannerModel]?, String?) -> Void)) {
        NetworkManager.request(model: [BannerModel].self,
                               url: BannerEndpoint.bannerEndpoint.rawValue,
                               completion: completion)
    }
    
    
}
