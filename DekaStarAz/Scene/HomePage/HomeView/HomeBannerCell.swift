//
//  HomeBannerCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.01.24.
//

import UIKit

class HomeBannerCell: UICollectionViewCell {
    static let reuseID = "HomeBannerCell"
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
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = bounds
        contentView.backgroundColor = .red
    }

    
    func configure(item: BannerModel) {
        imageView.loadImage(url: item.image ?? "")
    }
    
    private func configureContraints() {
//        NSLayoutConstraint.activate([
//            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
//            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
//            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
//            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor )
//        ])
        
    }
}
