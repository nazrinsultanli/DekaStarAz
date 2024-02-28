//
//  NetworkManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation
import Alamofire

class NetworkManager {
    
    
    static func request<T: Codable>(model: T.Type,
                                    url: String,
                                    method: HTTPMethod = .get,
                                    parameters: Parameters? = nil,
                                    encoding: ParameterEncoding = URLEncoding.default,
                                   // header: HTTPHeaders? = nil,
                                    completion: @escaping ((T?, String?)-> Void))  {
        
        AF.request(NetworkHelperLinker.baseUrl + url,
                   method: method,
                   parameters: parameters,
                   encoding: encoding,
                   headers: NetworkHelperLinker.header).responseDecodable(of: T.self) { response in
            print("-----\(NetworkHelperLinker.baseUrl + url)")
            switch response.result {
            case .success(let data):
                completion(data, nil)
            case .failure(let error):
                completion(nil, error.localizedDescription)
            }
        }
    }
    
    
    
//    func createNewItemWithDictionary(postModel: [String:Any]) {
//        NetworkManager.request(model: CheckoutModel.self,
//                               url: CheckOutEndpoint.checkOutEndpoint.rawValue,
//                               method: .post,
//                               parameters: postModel,
//                               encoding: JSONEncoding.default) { item, errorMessage in
//            
//            if let errorMessage = errorMessage {
//                self.error?(errorMessage)
//            } else if let item{
//                self.items.insert(item, at: 0)
//                self.success?()
//            }
//        }
//    }
    //MARK: previous Version
    /*
    func createNewItemWithStructObject() {
        let postModel = Post(userId: 212,
                             id: 21,
                             title: "naz",
                             body: "asasasa")
        
        NetworkManager.request(url: "posts",
                               method: .post,
                               parameters: postModel,
                               encoding: JSONEncoding.default) { data, errorMessage in
            if let errorMessage = errorMessage {
                print(errorMessage)
            } else {
                do {
                    let item = try JSONDecoder().decode(Post.self, from: data ?? Data())
                    self.items.insert(item, at: 0)
                    self.success?()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
        
    }
    
    */
}
