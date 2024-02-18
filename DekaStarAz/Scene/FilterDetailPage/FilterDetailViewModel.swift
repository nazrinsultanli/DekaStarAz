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
    var selectedCategory: String?
    
    func getfilterItems(){
        
        
        switch self.filterType {
        case .category:
            manager.getFilterEntries { data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.filterItems = data.categories ?? []
                    self.success?()
                }
            }
            
        case .collection:
            
            manager.getFilterSpecificEntries(categoryKey: selectedCategory ?? "")  { data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.filterItems = data.collections ?? []
                    self.success?()
                }
            }
            
        case .brand:
            
            manager.getFilterSpecificEntries(categoryKey: selectedCategory ?? "")  { data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.filterItems = data.brands ?? []
                    self.success?()
                }
            }

        default:
            break
        }
        
        
        

        
        
        
    }
}
