//
//  SettingUseCase.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation
protocol SettingUseCase {
    func getAbout(completion: @escaping ((AboutDataModel?, String?) -> Void))
    
    func getPrivacy(completion: @escaping ((PrivacyPolicyModel?, String?) -> Void))
    
    func getDelivery(completion: @escaping ((DeliveryPolicyModel?, String?) -> Void))
    
    func getAboutContactInfo(completion: @escaping ((ContactInfoModel?, String?) -> Void))
}
