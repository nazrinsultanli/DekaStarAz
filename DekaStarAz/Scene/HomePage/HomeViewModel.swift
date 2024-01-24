//
//  HomeViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

struct HomePageStructModel {
    
}

class HomeViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var bannerItems = [BannerModel]()
    
    func getBanners() {
        
        manager.getBannerList(){ data, errorMessage in

            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.bannerItems.append(data)
                self.success?()
            }
        }
    }
}
