//
//  HomePageManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation

class HomePageManager: BannerListUseCase, CategoryUseCase, HomeItemUseCase,  FilterUseCase {

    func getFilterEntries(completion: @escaping ((FilterEntriesModel?, String?) -> Void)) {
        NetworkManager.request(model: FilterEntriesModel.self,
                               url: ProductEndpoint.filterEntriesEndoint.rawValue,
                               completion: completion)
    }
    
    func getFilteredPrododuct(categoryKey: String, 
                              collection: String,
                              brand: String,
                              inStock: Bool,
                              minPrice: String,
                              maxPrice: String,
                              language: String,
                              completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        let stock = (inStock == true) ? "1" : "0"
       
        let filterUrl = ProductEndpoint.filterEndpoint.rawValue + "?collection=" + collection + "&in_stock=" + stock + "&min_price=" + minPrice + "&max_price=" + maxPrice + "&category=" + categoryKey + "&lang=" + language
        
       
        
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: filterUrl,
                               completion: completion)
    }
    


    func getHomeItems(endPoint: HomeItemsEndpoint, completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: endPoint.rawValue,
                               completion: completion)
    }
    

    
    func getCategoryList(completion: @escaping (([OneEntryModel]?, String?) -> Void)) {
        NetworkManager.request(model: [OneEntryModel].self,
                               url: CategoryEndpoint.categoryEndpoint.rawValue,
                               completion: completion)
    }
    
    
    func getBannerList(completion: @escaping (([BannerModel]?, String?) -> Void)) {
        NetworkManager.request(model: [BannerModel].self,
                               url: BannerEndpoint.bannerEndpoint.rawValue,
                               completion: completion)
    }
    
    
}
