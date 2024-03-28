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
    let type: HomePageItemType
    let resultData: [HomePagesItemsProtocols]
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
    
    func getAllHomeItems() {
        getCategoryItem(endPoint: CategoryEndpoint.categoryEndpoint, title: "Categories", type: .category) {
            self.getEachItems(endPoint: HomeItemsEndpoint.recentEndpoint, title: "Recent Products", type: .recent) {
                self.getEachItems(endPoint: HomeItemsEndpoint.discountedEndpoint, title: "Discounted Products", type: .discounted) {
                    self.success?()
                }
            }
        }
    }
    
    func getCategoryItem(endPoint: CategoryEndpoint, title: String, type: HomePageItemType, completion: @escaping () -> Void) {
        manager.getCategoryList { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.homeItems.append(.init(title: title,  type: type, resultData: data ))
                completion()
            }
        }
    }
    
    func getEachItems(endPoint: HomeItemsEndpoint, title: String, type: HomePageItemType , completion: @escaping () -> Void) {
        manager.getHomeItems(endPoint: endPoint){ data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.homeItems.append(.init(title: title, type: type, resultData: data.results ?? []))
                completion()
            }
        }
    }
    
}
