//
//  HomeViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

enum HomePageItemType {
    case category
    case recent
    case discounted
}
struct HomePageStruct {
    let title: String
    let endPoint: HomeItemsEndpoint
    let type: HomePageItemType
    let resultData: [HomeProductResult]
}

class HomeViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var bannerItems = [BannerModel]()
    var homeItems = [HomePageStruct]()
    var saledItems = [HomePageProductsModel]()
    var recentItems = [HomePageProductsModel]()
    
    var items = [HomePagesItemsProtocols]()
    
    func getBanners() {
        manager.getBannerList(){ data, errorMessage in

            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.bannerItems.append(contentsOf: data)
                self.success?()
            }
        }
    }
    
    
    func getAllHomeItems() {
        getEachItems(endPoint: HomeItemsEndpoint.recentEndpoint, title: "Recent Products", type: .recent)
        getEachItems(endPoint: HomeItemsEndpoint.discountedEndpoint, title: "Discounted Products", type: .discounted)
    }
    
    func getEachItems(endPoint: HomeItemsEndpoint, title: String, type: HomePageItemType ) {
        
        manager.getHomeItems(endPoint: endPoint){ data, errorMessage in
            
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.homeItems.append(.init(title: title, endPoint: endPoint, type: type, resultData: data.results ?? []))
                
                //self.items.append(contentsOf: self.homeItems)
                
                self.success?()
            }
        }
    }
}
