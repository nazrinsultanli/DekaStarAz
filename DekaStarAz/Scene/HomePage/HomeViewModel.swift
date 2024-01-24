//
//  HomeViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

enum HomePageItemType {
    case category
    case recent(HomePageProductsModel?)
    case discounted(HomePageProductsModel?)
}
struct HomePageStruct {
    let title: String
    let type: HomePageItemType
    var height: CGFloat
}

class HomeViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var bannerItems = [BannerModel]()
    var homeItems = [HomePageStruct]()
    
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
    
//    
//    func homeItems() {
//        getEachItems(endpoint: HomeItemsEndpoint.recentEndpoint, title: "Recent Products")
//        getEachItems(endpoint: HomeItemsEndpoint.discountedEndpoint, title: "Discounted Products")
//    }
//    
//    func getEachItems(endpoint: HomeItemsEndpoint, title: String) {
//        
//        manager.getHomeItems(endPoint: endpoint){ data, errorMessage in
//            
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                guard let results = data else  {return}
//                self.homeItems.append(.init(title: title, endPoint: endpoint, result: results))
//                self.success?()
//            }
//        }
//    }
}
