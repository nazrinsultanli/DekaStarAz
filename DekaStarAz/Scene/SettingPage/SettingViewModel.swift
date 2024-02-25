//
//  SettingViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation

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
}
