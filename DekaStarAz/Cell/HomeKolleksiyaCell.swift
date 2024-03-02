//
//  HomeKolleksiyaCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.01.24.
//

import UIKit

class HomeKolleksiyaCell: UICollectionViewCell {
    
    static let reuseID = "HomeKolleksiyaCell"
  
    private lazy var shadowUIView: UIView = {
        let grayBack = UIView()
        grayBack.translatesAutoresizingMaskIntoConstraints = false
        grayBack.backgroundColor = UIColor(named: "BlackWhite") // black
        grayBack.layer.cornerRadius = 10
        grayBack.layer.borderWidth = 1
        grayBack.alpha = 0.3
        return grayBack
     }()
    
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 10
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .brown
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.textColor = UIColor(named: "backgroundColor")
        return label
    }()
   
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureConstraints() {
        contentView.addSubview(imageView)
        contentView.addSubview(shadowUIView)
        contentView.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor ),
            
            shadowUIView.topAnchor.constraint(equalTo: imageView.topAnchor),
            shadowUIView.leadingAnchor.constraint(equalTo: imageView.leadingAnchor),
            shadowUIView.trailingAnchor.constraint(equalTo: imageView.trailingAnchor),
            shadowUIView.bottomAnchor.constraint(equalTo: imageView.bottomAnchor ),
     
            titleLabel.topAnchor.constraint(equalTo: imageView.topAnchor, constant: 30),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 30),
            
        ])
    }

    func configure(item: HomePagesItemsProtocols){
        imageView.loadImage(url: item.photoLink)
        titleLabel.text = item.titleText
    }
}
