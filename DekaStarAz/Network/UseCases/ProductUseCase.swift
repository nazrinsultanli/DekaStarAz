//
//  ProductUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 03.02.24.
//

import Foundation
protocol ProductUseCase {
    func getPrododuct(slug:String, language: String,  completion: @escaping((ProductModel?,String?) ->Void))
}

