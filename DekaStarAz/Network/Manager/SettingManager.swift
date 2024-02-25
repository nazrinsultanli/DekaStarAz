//
//  SettingManager.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation
class SettingManager: SettingUseCase {
    func getAbout(completion: @escaping ((AboutDataModel?, String?) -> Void)) {
        NetworkManager.request(model: AboutDataModel.self,
                               url: SettingsEndpoint.aboutEndpoint.rawValue,
                               completion: completion)
    }
    
    func getPrivacy(completion: @escaping ((PrivacyPolicyModel?, String?) -> Void)) {
        NetworkManager.request(model: PrivacyPolicyModel.self,
                               url: SettingsEndpoint.privacyEndpoint.rawValue,
                               completion: completion)
    }
    
    func getDelivery(completion: @escaping ((DeliveryPolicyModel?, String?) -> Void)) {
        NetworkManager.request(model: DeliveryPolicyModel.self,
                               url: SettingsEndpoint.deliveryEndoint.rawValue,
                               completion: completion)
    }
    
    func getAboutContactInfo(completion: @escaping ((ContactInfoModel?, String?) -> Void)) {
        NetworkManager.request(model: ContactInfoModel.self,
                               url: SettingsEndpoint.contactEndpoint.rawValue,
                               completion: completion)
    }
    
}
