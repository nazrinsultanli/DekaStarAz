//
//  HomePageManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation

class HomePageManager: BannerListUseCase {
    func getBannerList(completion: @escaping ((BannerModel?, String?) -> Void)) {
        NetworkManager.request(model: BannerModel.self,
                               url: BannerEndpoint.bannerEndpoint.rawValue,
                               completion: completion)
    }
    
    
}
