//
//  FavoriteViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 23.02.24.
//

import Foundation

class FavoriteViewModel {
    var favoriteItem: ProductModel?
    var favItemsfromFile = [ProductModel]()
    
    init(favoriteItem: ProductModel) {
        self.favoriteItem = favoriteItem
        
        fileHelper.readDataFromFile { favProducts in
            self.favItemsfromFile = favProducts
        }
    }
//    var favoriteItems: [ProductModel] = []
    let fileHelper = FileManagerHelper()

    
    func addFavoriteProduct() {
        if let item = favoriteItem{
            favItemsfromFile.append(item)
            fileHelper.writeDataToFile(products: favItemsfromFile)
        }
    }
//    func readFavoritesProductsFromFile () {
//        fileHelper.readDataFromFile { favProducts in
//            self.favItemsfromFile = favProducts
//        }
//    }
    
}
