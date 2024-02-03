//
//  ProductModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.02.24.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let movie = try? JSONDecoder().decode(Movie.self, from: jsonData)

import Foundation

// MARK: - Movie
struct ProductModel: Codable {
    let id: Int?
    let name, slug, regularPrice: String?
    let discount: Int?
    let discountPrice: String?
    let inStock: Bool?
    let inStockDisplayValue: String?
    let collection: ProductCollection?
    let images: [ProductImage]?
    let information: ProductInformation?
    let imageFeatureURL: String?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case regularPrice = "regular_price"
        case discount
        case discountPrice = "discount_price"
        case inStock = "in_stock"
        case inStockDisplayValue = "in_stock_display_value"
        case collection, images, information
        case imageFeatureURL = "image_feature_url"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Collection
struct ProductCollection: Codable {
    let id: Int?
    let name, slug: String?
    let coverImage: String?
    let category: CategoryModel?
    let brand: BrandModel?
    let createdAt, updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case coverImage = "cover_image"
        case category, brand
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

struct BrandModel: Codable {
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
// MARK: - Image
struct ProductImage: Codable {
    let id: Int?
    let image: String?
    let isFeature: Bool?

    enum CodingKeys: String, CodingKey {
        case id, image
        case isFeature = "is_feature"
    }
}

// MARK: - Information
struct ProductInformation: Codable {
    let text: String?
}
