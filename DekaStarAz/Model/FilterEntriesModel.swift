//
//  FilterEntriesModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

struct FilterEntriesModel: Codable {
    let currentCategory: OneEntryModel
    let ancestorCategories: [OneEntryModel]?
    let categories, collections, brands: [OneEntryModel]?

    enum CodingKeys: String, CodingKey {
        case currentCategory = "current_category"
        case ancestorCategories = "ancestor_categories"
        case categories, collections, brands
    }
}



struct OneEntryModel: Codable, Hashable , HomePagesItemsProtocols {
    var collectionName: String {
        ""
    }
    
    var discountId: Int {
        0
    }
    
    var originalId: Int {
        id ?? 0
    }
    
    var slugId: String {
        slug ??  ""
    }
    
    var titleText: String {
        name ?? ""
    }
    
    var photoLink: String {
        coverImage ?? ""
    }
    
    var originalPrice: String {
        ""
    }
    
    var saledPrice: String {
        ""
    }
    
    let id: Int?
    let name, slug: String?
    let parent: Int?
    let coverImage: String?
    let categoryName, createdAt, updatedAt: String?
    let productsCount: Int?

    enum CodingKeys: String, CodingKey {
        case id, name, slug, parent
        case coverImage = "cover_image"
        case categoryName = "category_name"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case productsCount = "products_count"
    }
}
