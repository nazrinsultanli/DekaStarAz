//
//  HomePageProductsModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation

// MARK: - Movie
struct HomePageProductsModel: Codable {
    let links: Links?
    let currentPage, count, totalPages, perPage: Int?
    let results: [HomeProductResult]?

    enum CodingKeys: String, CodingKey {
        case links
        case currentPage = "current_page"
        case count
        case totalPages = "total_pages"
        case perPage = "per_page"
        case results
    }
}

// MARK: - Links
struct Links: Codable {
    let next: String?
    let previous: String?
    let current, first, last: String?
}

// MARK: - Result
struct HomeProductResult: Codable, HomePagesItemsProtocols {
    var collectionName: String {
        collection?.name ?? ""
    }
    
    var discountId: Int {
        discount ?? 0
    }
    
    var originalId: Int {
        id ?? 0
    }
    
    var slugId: String {
        slug ?? ""
    }
    
    var titleText: String {
        name ?? ""
    }
    
    var photoLink: String {
        imagefeatureurl ?? ""
    }
    
    var originalPrice: String {
        regularPrice ?? ""
    }
    
    var saledPrice: String {
        discountPrice ?? ""
    }
    
    
    let id: Int?
    let name, slug, regularPrice: String?
    let discount: Int?
    let discountPrice: String?
    let inStock: Bool?
    let imagefeatureurl, isActiveDisplayValue, inStockDisplayValue, quantityType: String?
    let updatedAt, createdAt: String?
    let collection: CollectionModel?
    
    
    

    enum CodingKeys: String, CodingKey {
        case id, name, slug, collection
        case regularPrice = "regular_price"
        case discount
        case discountPrice = "discount_price"
        case inStock = "in_stock"
        case imagefeatureurl = "image_feature_url"
        case isActiveDisplayValue = "is_active_display_value"
        case inStockDisplayValue = "in_stock_display_value"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case quantityType = "quantity_type"
    }
}

struct CollectionModel: Codable {
        
        let id: Int?
        let name, slug: String?
        let coverImage: String?
       // let categoryName: String?
        let createdAt, updatedAt: String?

        enum CodingKeys: String, CodingKey {
            case id, name, slug
            case coverImage = "cover_image"
           // case categoryName = "category_name"
            case createdAt = "created_at"
            case updatedAt = "updated_at"
        }
    
}
