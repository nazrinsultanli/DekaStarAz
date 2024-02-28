//
//  FileManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.02.24.
//

import Foundation

enum FileManagerName: String {
    case favorite = "favoriteProduct.json"
    case basket = "basketProduct.json"
}

class FileManagerHelper {
    
    func getFilePath(fileSelection: FileManagerName) -> URL {
        let files = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        guard let documentDirectory = files.first else {
            print("Error: Document directory URLs array is empty or doesn't contain enough elements.")
            return files.first!
        }

        var path: URL

        path = documentDirectory.appendingPathComponent(fileSelection.rawValue)
        if !FileManager.default.fileExists(atPath: path.path) {
            // File doesn't exist, create it
            FileManager.default.createFile(atPath: path.path, contents: nil, attributes: nil)
        }
//        switch fileSelection {
//        case .favorite:
//            path = documentDirectory.appendingPathComponent(FileManagerName.favorite.rawValue)
//            if !FileManager.default.fileExists(atPath: path.path) {
//                // File doesn't exist, create it
//                FileManager.default.createFile(atPath: path.path, contents: nil, attributes: nil)
//            }
//        case .basket:
//            path = documentDirectory.appendingPathComponent(FileManagerName.basket.rawValue)
//            if !FileManager.default.fileExists(atPath: path.path) {
//                // File doesn't exist, create it
//                FileManager.default.createFile(atPath: path.path, contents: nil, attributes: nil)
//            }
//        }
        print(path)
        return path
    }



    func writeDataToFile<T: Encodable>(data: T, fileSelection: FileManagerName) {
        do {
            let encodedData = try JSONEncoder().encode(data)
            try encodedData.write(to: getFilePath(fileSelection: fileSelection))
        } catch {
            print(error.localizedDescription)
        }
    }

    
    func readDataFromFile<T: Decodable>(fileSelection: FileManagerName, completion: @escaping (T?) -> Void) {
        let filePath = getFilePath(fileSelection: fileSelection)
        if FileManager.default.fileExists(atPath: filePath.path) {
            do {
                let data = try Data(contentsOf: filePath)
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(decodedData)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
        } else {
            print("File does not exist--------: \(filePath.lastPathComponent)")
            completion(nil)
        }
    }

}
