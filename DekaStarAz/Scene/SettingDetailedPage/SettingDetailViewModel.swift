//
//  SettingDetailViewModel.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation

class SettingDetailViewModel {
    init(settingType: SettingItemsNames) {
        self.settingType = settingType
    }
    
    private let manager = SettingManager()
    var settingItem: SettingsPageItemsProtocols?
    var settingType: SettingItemsNames?
    var success: (() -> Void)?
    var error: ((String) -> Void)?
    
    func getSettingItems() {
        switch self.settingType {
        case .aboutData:
            manager.getAbout{ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.settingItem = data
                    self.success?()
                }
            }
        case .deliveryPolicy:
            manager.getDelivery{ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.settingItem = data
                    self.success?()
                }
            }
        case .contactData:
            manager.getAboutContactInfo{ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.settingItem = data
                    self.success?()
                }
            }
        case .privacyPolicy:
            manager.getPrivacy{ data, errorMessage in
                if let errorMessage {
                    self.error?(errorMessage)
                } else if let data {
                    self.settingItem = data
                    self.success?()
                }
            }
        case .none:
            break
        }
    }
}
