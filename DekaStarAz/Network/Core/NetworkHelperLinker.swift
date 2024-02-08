//
//  NetworkHelperLinker.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 20.01.24.
//

import Foundation
import Alamofire
class NetworkHelperLinker {
    static var baseUrl = "https://dekastar.az/api/"
    static var language = "lang="
    static var header: HTTPHeaders = ["X-Api-Key" : "HqSu5ZZV.3qgoKJO12U0X7Lk2jtiSDyiiqHnD7Zy7"]
}

//
//
//enum HttpMethod: String {
//    case get = "GET"
//    case post = "POST"
//}
//
//enum ErrorTypes: String, Error {
//    case invalidData = "Invalid data"
//    case invalidURL = "Invalid url"
//    case generalError = "An error happened"
//}
//
//class NetworkHelper {
//    static let shared = NetworkHelper()
//    
//    func requestUrl(url: String) -> String {
//        "https://rss.applemarketingtools.com/api/v2/us/\(url)"
//    }
//}
