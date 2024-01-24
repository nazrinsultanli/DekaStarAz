//
//  CategoryUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import Foundation
protocol CategoryUseCase {
    func getCategoryList(completion: @escaping((CategoryModel?,String?)-> Void))
}
