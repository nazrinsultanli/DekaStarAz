//
//  FileManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.02.24.
//

import Foundation
class FileManagerHelper {
    func getFilePath() -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let path = files[0].appendingPathComponent("favoriteProduct.json")
        print(path)
        return path
    }
    
    func writeDataToFile(products: [ProductModel]) {
        do {
            let data = try JSONEncoder().encode(products)
            try data.write(to: getFilePath())
        } catch {
            print(error.localizedDescription)
        }
    }
    
    func readDataFromFile(complete: (([ProductModel]) -> Void)) {
        if let data = try? Data(contentsOf: getFilePath()) {
            do {
                let items = try JSONDecoder().decode([ProductModel].self, from: data)
                complete(items)
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
