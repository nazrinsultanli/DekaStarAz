//
//  ProductDetailedHeaderCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import UIKit

class ProductDetailedHeaderCell: UICollectionViewCell {
    static let reuseID = "ProductDetailedHeaderCell"
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 5
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .clear
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
    }

    func configure(item: ProductImage) {
        imageView.loadImage(url: item.image ?? "" )
    }
    
    private func configureContraints() {
        addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor ),
        ])
    }
}
