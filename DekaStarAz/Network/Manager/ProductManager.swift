//
//  File.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.02.24.
//

import Foundation

class ProductManager: ProductUseCase {
    func getPrododuct(slug:String, language: String, completion: @escaping ((ProductModel?, String?) -> Void)) {
        NetworkManager.request(model: ProductModel.self,
                               url: ProductEndpoint.productEndpoint.rawValue + slug + NetworkHelperLinker.language + language,
                               completion: completion)
    }
}
