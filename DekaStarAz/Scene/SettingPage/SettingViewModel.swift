//
//  SettingViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation
import UIKit
import SafariServices

enum SettingItemsNames: String, CaseIterable {
    case aboutData = "Haqqimizda"
    case contactData = "Elaqe"
    case privacyPolicy = "Mexfilik Siyaseti"
    case deliveryPolicy = "Catdirilma siyaseti"
   
}
enum SettingItemsLinks: String {
    case aboutData = "https://dekastar.az/api/about"
    case contactData = "https://dekastar.az/api/contact"
    case privacyPolicy = "https://dekastar.az/api/privacy-policy"
    case deliveryPolicy = "https://dekastar.az/api/delivery-policy"
}
struct SettingItemsStructModel {
    var aboutData: String
    var contactData: String
    var privacyPolicy: String
    var deliveryPolicy: String

}

class SettingViewModel {
    var settingItems: [SettingItemsNames] = SettingItemsNames.allCases
    
    
    func settingItemSafari(link: SettingItemsLinks) {
        if let url = URL(string: link.rawValue ) {
                let safariViewController = SFSafariViewController(url: url)
                UIApplication.shared.windows.first?.rootViewController?.present(safariViewController, animated: true, completion: nil)
            }
        }
}
