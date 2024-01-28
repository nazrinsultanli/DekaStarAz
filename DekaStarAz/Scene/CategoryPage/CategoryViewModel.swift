//
//  CategoryViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 28.01.24.
//

import Foundation

class CategoryViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var categoryItems = [CategoryModel]()
    var recentITems = [HomePageProductsModel]()
    var discountedItems = [HomePageProductsModel]()
   
    
//    func getBanners() {
//        manager.getBannerList(){ data, errorMessage in
//
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.bannerItems.append(contentsOf: data)
//                self.success?()
//            }
//        }
//    }
    
//    func getAllHomeItems() {
//        getCategoryItem(endPoint: CategoryEndpoint.categoryEndpoint, title: "Categories", type: .category) {
//            self.getEachItems(endPoint: HomeItemsEndpoint.recentEndpoint, title: "Recent Products", type: .recent) {
//                self.getEachItems(endPoint: HomeItemsEndpoint.discountedEndpoint, title: "Discounted Products", type: .discounted) {
//                    self.success?()
//                }
//            }
//        }
//    }
//    
//    
//    func getCategoryItem(endPoint: CategoryEndpoint, title: String, type: HomePageItemType, completion: @escaping () -> Void) {
//        
//        manager.getCategoryList { data, errorMessage in
//            
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.homeItems.append(.init(title: title,  type: type, resultData: data ))
//                //self.success?()
//                completion()
//            }
//        }
//    }
//    
//    func getEachItems(endPoint: HomeItemsEndpoint, title: String, type: HomePageItemType , completion: @escaping () -> Void) {
//        manager.getHomeItems(endPoint: endPoint){ data, errorMessage in
//            if let errorMessage {
//                self.error?(errorMessage)
//            } else if let data {
//                self.homeItems.append(.init(title: title, type: type, resultData: data.results ?? []))
//                //self.success?()
//                completion()
//            }
//        }
//    }

}
