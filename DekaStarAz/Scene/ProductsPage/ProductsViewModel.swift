//
//  ProductsViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import Foundation
struct SpecificProductModel {
    var filterType: FilterItemsNames
    var filterSlug: Any
}

class ProductsViewModel {
    private let manager = HomePageManager()
    private let searchManager = SearchManager()
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    var categorySlugId: String?
    var product: HomePageProductsModel?
    var productsItems = [HomeProductResult]()
    var homeItemsType: HomePageItemType?
    var filterManager = ProductManager()
    var filterItemsInfo: FilterItemsStructModel?
    var searchText: String?
    var specificProductSlugs = [SpecificProductModel]()
    
    func getAllItems(){
        print("searchj viewM: \(searchText)")
        if searchText  != nil {
            productsItems.removeAll()
            getSearchItems(searchedText: searchText ?? "")
        } else {
            if filterItemsInfo == nil  {
                productsItems.removeAll()
                if let homeItemsType = homeItemsType {
                    getItems(type: homeItemsType)
                }
            }
            else{
                productsItems.removeAll()
                if let item = filterItemsInfo {
                    getFilteredItems(items: item)
                }
            }
        }
    }
    
    func getSearchItems(searchedText: String) {
        searchManager.getSearchItems(searchText: searchedText){ data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.product = data
                self.productsItems.append(contentsOf:data.results ?? [])
                self.success?()
            }
        }
    }
    
    func getItems(type: HomePageItemType) {
        switch type {
        case .discounted:
            manager.getHomeItems(endPoint: HomeItemsEndpoint.discountedEndpoint){ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.product = data
                    self.productsItems.append(contentsOf:data.results ?? [])
                    self.success?()
                }
            }
        case .recent:
            manager.getHomeItems(endPoint: HomeItemsEndpoint.recentEndpoint){ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.product = data
                    self.productsItems.append(contentsOf:data.results ?? [])
                    self.success?()
                }
            }
        case .category:
            filterManager.getFilteredPrododuct(categoryKey: categorySlugId ?? "",
                                         collection: "",
                                         brand: "",
                                         inStock: true,
                                         minPrice: "",
                                         maxPrice: "",
                                         language:
                                            "az"){ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.product = data
                    self.productsItems.append(contentsOf:data.results ?? [])
                    self.success?()
                }
            }
        }
    }
    
    func getFilteredItems(items: FilterItemsStructModel) {
        filterManager.getFilteredPrododuct(categoryKey: items.category,
                                           collection: items.collection,
                                           brand: items.brand,
                                           inStock: items.inStock,
                                           minPrice: items.minPrice,
                                           maxPrice: items.maxPrice,
                                           language: "az") { data, errorMessage in
            if let errorMessage {
                self.error?(errorMessage)
            } else if let data {
                self.product = data
                self.productsItems.append(contentsOf:data.results ?? [])
                self.success?()
            }
        }
    }
    
}
