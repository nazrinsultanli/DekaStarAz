//
//  Extensions.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//


import Kingfisher
import UIKit

extension UIImageView {
    func loadImage(url:String) {
        
       // if let finalUrl = URL(string: url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? ""){
        if let finalUrl = URL(string: url) {
            self.kf.setImage(with: finalUrl )
            print(finalUrl)
        }
    }
}
