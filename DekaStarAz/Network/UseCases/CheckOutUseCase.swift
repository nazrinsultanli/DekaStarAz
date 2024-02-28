//
//  CheckOutUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import Foundation
protocol CheckOutUseCase {
    func getPrododuct(postData:[String: Any], completion: @escaping ((CheckoutModel?, String?) -> Void))
}
