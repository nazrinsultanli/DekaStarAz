//
//  HomeItemsModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

enum HomeItemsEndpoint: String {
    case recentEndpoint = "store/products?type=new&lang=az"
    case discountedEndpoint = "store/products?type=discounted&lang=az"
}
