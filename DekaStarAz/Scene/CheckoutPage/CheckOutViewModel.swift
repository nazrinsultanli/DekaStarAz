//
//  CheckOutViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import Foundation
class CheckOutViewModel {
    private let manager = CheckOutManager()
    var builder: CheckoutBuilder?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func postData() {
        manager.getPrododuct(postData: builder?.chekoutBuild() ?? [:]) { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.success?()
            }
        }
    }
    
}
