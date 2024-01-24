//
//  HomeCollectionHeaderCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import UIKit

class HomeCollectionHeaderCell: UICollectionReusableView {
    static let reuseID = "HomeCollectionHeaderCell"
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 25
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.backgroundColor = .red
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
    }

    
    func configure(item: BannerModel) {
        imageView.loadImage(url: item.image ?? "")
    }
}
