//
//  CheckOutManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import Foundation
class CheckOutManager: CheckOutUseCase {
    func getPrododuct(postData:[String: Any],
                      completion: @escaping ((CheckoutModel?, String?) -> Void)) {
        
        NetworkManager.request(model: CheckoutModel.self,
                               url: CheckOutEndpoint.checkOutEndpoint.rawValue,
                               method: .post,
                               parameters: postData,
                               completion: completion)
    }
}
