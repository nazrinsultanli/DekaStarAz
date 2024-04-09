//
//  File.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.02.24.
//

import Foundation

class ProductManager: ProductUseCase, FilterUseCase {
    func getPaginationProduct(urlNext: String, completion: @escaping ((HomePageProductsModel?, String?) -> Void)) {
        let url = urlNext.replacingOccurrences(of: NetworkHelperLinker.baseUrl, with: "")
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: url,
                               completion: completion)
    }
    
    func getFilterSpecificEntries(categoryKey: String, completion: @escaping ((FilterEntriesModel?, String?) -> Void)) {
        NetworkManager.request(model: FilterEntriesModel.self,
                               url: ProductEndpoint.filterSomeEntries.rawValue + categoryKey,
                               completion: completion)
    }
    
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
       
        let filterUrl = ProductEndpoint.filterEndpoint.rawValue + "?collection=" + collection + "&brand=" + brand + "&in_stock=" + stock + "&min_price=" + minPrice + "&max_price=" + maxPrice + "&category=" + categoryKey + "&lang=" + language
        
        NetworkManager.request(model: HomePageProductsModel.self,
                               url: filterUrl,
                               completion: completion)
    }
    
    func getPrododuct(slug:String,
                      language: String,
                      completion: @escaping ((ProductModel?, String?) -> Void)) {
        NetworkManager.request(model: ProductModel.self,
                               url: ProductEndpoint.productEndpoint.rawValue + slug + "?" + NetworkHelperLinker.language + language,
                               completion: completion)
    }
    
    
}

