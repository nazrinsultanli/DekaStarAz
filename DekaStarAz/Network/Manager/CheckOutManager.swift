//
//  CheckOutManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import Foundation
import Alamofire
class CheckOutManager: CheckOutUseCase {
    func postBasketProducts(postData:[String: Any],
                      completion: @escaping ((CheckoutModel?, String?) -> Void)) {
        
        NetworkManager.request(model: CheckoutModel.self,
                               url: CheckOutEndpoint.checkOutEndpoint.rawValue,
                               method: .post,
                               parameters: postData,
                               encoding: JSONEncoding.default,
                               completion: completion)
    }
}
