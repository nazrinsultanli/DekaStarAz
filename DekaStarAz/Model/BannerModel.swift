//
//  Banner.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation

// MARK: - Banner
struct BannerModel: Codable {
    let id: Int?
    let image: String?
    let link: String?
    let isActive: Bool?

    enum CodingKeys: String, CodingKey {
        case id, image, link
        case isActive = "is_active"
    }
}
