//
//  HomePagesItemsProtocols.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 26.01.24.
//

import Foundation

protocol HomePagesItemsProtocols {
    var titleText: String { get }
    var photoLink: String { get }
    var originalPrice: String { get }
    var saledPrice: String { get }
    var slugId: String { get }
    var originalId: Int { get }
    
}
