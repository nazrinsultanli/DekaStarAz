//
//  File.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.02.24.
//

import Foundation

class ProductManager: ProductUseCase, FilterUseCase {
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
        
       
        print("******")
        print(filterUrl)
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


//https://dekastar.az/api/store/products?collection={collection.slug}&in_stock=1&min_price=10&max_price=417&category=laminat&lang=az
//https://www.dekastar.az/store/categories/kateqoriya-1?brand=brand-1&collection=kolleksiya-1&min_price=480&max_price=1049
