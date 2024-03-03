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

struct SettingItemsStructModel {
    var aboutData: String
    var contactData: String
    var privacyPolicy: String
    var deliveryPolicy: String
}

class SettingViewModel {
    var settingItems: [SettingItemsNames] = SettingItemsNames.allCases
    func settingItemSafari(type: SettingItemsNames) {
        var url: String?
        switch type {
        case .aboutData:
            url = SafariLinks.aboutData.rawValue
        case .contactData:
            url = SafariLinks.contactData.rawValue
        case .privacyPolicy:
            url = SafariLinks.privacyPolicy.rawValue
        case .deliveryPolicy:
            url = SafariLinks.deliveryPolicy.rawValue
        }
        UIApplication.shared.presentSafariViewController(urlLink: url ?? "")
    }
}
