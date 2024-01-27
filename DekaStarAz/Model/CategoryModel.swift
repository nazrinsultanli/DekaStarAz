//
//  CategoryModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation


// MARK: - MovieElement
struct CategoryModel: Codable  , HomePagesItemsProtocols {
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

    enum CodingKeys: String, CodingKey {
        case id, name, slug, parent
        case coverImage = "cover_image"
        case categoryName = "category_name"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}
