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

    let fileHelper = FileManagerHelper()

    
    func addFavoriteProduct() {
        if let item = favoriteItem{
            favItemsfromFile.append(item)
            fileHelper.writeDataToFile(products: favItemsfromFile)
        }
    }
    
    
    func readFavoritesProductsFromFile (completion: @escaping () -> Void) {
        fileHelper.readDataFromFile { favProducts in
            self.favItemsfromFile = favProducts
            completion()
        }
    }
    
}
