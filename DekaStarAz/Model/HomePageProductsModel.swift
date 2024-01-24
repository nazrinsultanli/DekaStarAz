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
    let results: [Result]?

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
    let next, previous: JSONNull?
    let current, first, last: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name, slug, regularPrice: String?
    let discount: Int?
    let discountPrice: String?
    let inStock: Bool?
    let getImageFeature, isActiveDisplayValue, inStockDisplayValue, createdAt: String?
    let updatedAt: String?

    enum CodingKeys: String, CodingKey {
        case id, name, slug
        case regularPrice = "regular_price"
        case discount
        case discountPrice = "discount_price"
        case inStock = "in_stock"
        case getImageFeature = "get_image_feature"
        case isActiveDisplayValue = "is_active_display_value"
        case inStockDisplayValue = "in_stock_display_value"
        case createdAt = "created_at"
        case updatedAt = "updated_at"
    }
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
