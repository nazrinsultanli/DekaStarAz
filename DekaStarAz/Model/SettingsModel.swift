//
//  File.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation
// MARK: - PrivacyPolicyModel
struct PrivacyPolicyModel: Codable, SettingsPageItemsProtocols {
    var siteTextLabel: String {
        privacyPolicyText ?? ""
    }
    
    var photoLink: String {
        privacyPolicyImage ?? ""
    }
    var email: [ContactEmail] {
        []
    }
    
    var phone: [ContactPhone] {
        []
    }
    var adresss: String {
        ""
    }
    
    var languagee: String {
        ""
    }
    
    var workingHour: String {
        ""
    }
    
    let privacyPolicyText: String?
    let privacyPolicyImage: String?

    enum CodingKeys: String, CodingKey {
        case privacyPolicyText = "privacy_policy_text"
        case privacyPolicyImage = "privacy_policy_image"
    }
}


// MARK: - DeliveryPolicyModel
struct DeliveryPolicyModel: Codable , SettingsPageItemsProtocols{
    var siteTextLabel: String {
        deliveryPolicyText ?? ""
    }
    
    var photoLink: String {
        deliveryPolicyImage ?? ""
    }
    
    var email: [ContactEmail] {
        []
    }
    
    var phone: [ContactPhone] {
        []
    }
    var adresss: String {
        ""
    }
    var languagee: String {
        ""
    }
    
    var workingHour: String {
        ""
    }
    
    let deliveryPolicyText: String?
    let deliveryPolicyImage: String?

    enum CodingKeys: String, CodingKey {
        case deliveryPolicyText = "delivery_policy_text"
        case deliveryPolicyImage = "delivery_policy_image"
    }
}


// MARK: - AboutDataModel



struct AboutDataModel: Codable , SettingsPageItemsProtocols{
    var siteTextLabel: String {
        aboutText ?? ""
    }
    
    var photoLink: String {
        aboutImage ?? ""
    }
    var email: [ContactEmail] {
        []
    }
    
    var phone: [ContactPhone] {
        []
    }
    var adresss: String {
        ""
    }
    var languagee: String {
        ""
    }
    
    var workingHour: String {
        ""
    }
    let aboutText: String?
    let aboutImage: String?

    enum CodingKeys: String, CodingKey {
        case aboutText = "about_text"
        case aboutImage = "about_image"
    }
}

struct SiteTextA: Codable {
    let about: String?
}
// MARK: - ContactInfo

struct ContactInfoModel: Codable , SettingsPageItemsProtocols{
    var siteTextLabel: String {
        ""
    }
    
    var photoLink: String {
        contactImage ?? ""
    }
    
    var email: [ContactEmail] {
        contactEmails ?? []
    }
    
    var phone: [ContactPhone] {
        contactPhones ?? []
    }
    var adresss: String {
        companyInfo?.address ?? ""
    }
    
    var languagee: String {
        companyInfo?.language ?? ""
    }
    
    var workingHour: String {
        companyInfo?.workingHours ?? ""
    }
    
    let contactEmails: [ContactEmail]?
    let contactPhones: [ContactPhone]?
    let companyInfo: CompanyInfo?
    let contactImage: String?

    enum CodingKeys: String, CodingKey {
        case contactEmails = "contact_emails"
        case contactPhones = "contact_phones"
        case companyInfo = "company_info"
        case contactImage = "contact_image"
    }
}

struct CompanyInfo: Codable {
    let id: Int?
    let language, address, workingHours: String?

    enum CodingKeys: String, CodingKey {
        case id, language, address
        case workingHours = "working_hours"
    }
}

struct ContactEmail: Codable {
    let id: Int?
    let email: String?
}


struct ContactPhone: Codable {
    let id: Int?
    let phone: String?
}

