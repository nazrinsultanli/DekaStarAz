//
//  BannerListUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation

protocol BannerListUseCase {
    func getBannerList(completion: @escaping((BannerModel?,String?)-> Void))
}
