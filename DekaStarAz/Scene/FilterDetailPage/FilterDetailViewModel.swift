//
//  FilterDetailViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 08.02.24.
//

import Foundation
class FilterDetailViewModel {
    private let manager = HomePageManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var filterType: filterItemsNames?
    var filterItems = [HomePagesItemsProtocols]()
    
    func getfilterItems(){
        switch filterType {
        case .category:
            manager.getCategoryList { data, errorMessage in
                
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.filterItems = data
                    self.success?()
                }
            }
        default:
            break
        }
        
    }
}
