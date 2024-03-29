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
            fileHelper.writeDataToFile(data: favItemsfromFile, fileSelection: .favorite)
        }
    }
    
    func readFavoritesProductsFromFile(completion: @escaping () -> Void) {
        fileHelper.readDataFromFile(fileSelection: .favorite) { (favProducts: [ProductModel]?) in
            if let favProducts = favProducts {
                self.favItemsfromFile = favProducts
                completion()
            } else {
                print("Failed to read favortie products from file.")
            }
        }
    }
}
