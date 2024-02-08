//
//  FilterDetailViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 08.02.24.
//

import Foundation
class FilterDetailViewModel {
    private let manager = ProductManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var filterType: FilterItemsNames?
    var filterItems = [HomePagesItemsProtocols]()
    
    func getfilterItems(){
        manager.getFilterEntries { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                
                switch self.filterType {
                case .category:
                    self.filterItems = data.categories ?? []
                case .collection:
                    self.filterItems = data.collections ?? []
                case .brand:
                    self.filterItems = data.brands ?? []
                default:
                    break
                }
                self.success?()
            }
        }
    }
}
