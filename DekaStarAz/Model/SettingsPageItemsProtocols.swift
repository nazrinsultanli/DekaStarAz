//
//  SettingsPageItemsProtocols.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import Foundation

protocol SettingsPageItemsProtocols {
    var siteTextLabel: String { get }
    var photoLink: String { get }
    var email:  [ContactEmail] { get }
    var phone:  [ContactPhone] { get }
    var adresss: String { get }
    var languagee: String { get }
    var workingHour: String { get }
   
    
}
