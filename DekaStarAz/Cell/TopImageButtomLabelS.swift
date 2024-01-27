//
//  TopImageButtomLabelS.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 16.01.24.
//


import UIKit
//import Kingfisher

//
//protocol TopImageButtonLabelCellProtocol {
//    var titleString: String { get}
//    var imageString: String { get}
//
//}
class TopImageButtomLabelS: UICollectionViewCell {
    static let reuseID = "TopImageButtomLabelS"
    
    private lazy var whiteUIView: UIView = {
         let whiteBack = UIView()
        whiteBack.translatesAutoresizingMaskIntoConstraints = false
        whiteBack.backgroundColor = . red
        whiteBack.layer.cornerRadius = 10
        whiteBack.layer.borderWidth = 1
         return whiteBack
     }()
    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 20
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleToFill
        imageView.backgroundColor = .brown
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        
        label.numberOfLines = 0
        return label
    }()
    private let kolleksiyaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        
        label.numberOfLines = 0
        return label
    }()
    
    private let originalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        
        label.numberOfLines = 0
        return label
    }()
    
    private let saledPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .center
        
        label.numberOfLines = 0
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
        contentView.addSubview(whiteUIView)
        contentView.addSubview(imageView)
        contentView.addSubview(titleLabel)
        contentView.addSubview(kolleksiyaLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(saledPriceLabel)
        
        NSLayoutConstraint.activate([
            
            whiteUIView.topAnchor.constraint(equalTo: topAnchor),
            whiteUIView.leadingAnchor.constraint(equalTo: leadingAnchor),
            whiteUIView.trailingAnchor.constraint(equalTo: trailingAnchor),
            whiteUIView.bottomAnchor.constraint(equalTo: bottomAnchor ),
            
            imageView.heightAnchor.constraint(equalToConstant: 100),
            imageView.topAnchor.constraint(equalTo: whiteUIView.topAnchor, constant: 0),
            imageView.leadingAnchor.constraint(equalTo: whiteUIView.leadingAnchor, constant: 0),
            imageView.trailingAnchor.constraint(equalTo: whiteUIView.trailingAnchor, constant: 0),
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 0),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 0),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
            titleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            kolleksiyaLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            kolleksiyaLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
            kolleksiyaLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            kolleksiyaLabel.heightAnchor.constraint(equalToConstant: 16),
            
            originalPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            originalPriceLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor, constant: 0),
           // originalPriceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            originalPriceLabel.heightAnchor.constraint(equalToConstant: 16),
            originalPriceLabel.widthAnchor.constraint(equalToConstant: 30),
            
            saledPriceLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 0),
            saledPriceLabel.leadingAnchor.constraint(equalTo: originalPriceLabel.leadingAnchor, constant: 4),
            saledPriceLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            saledPriceLabel.heightAnchor.constraint(equalToConstant: 16),
            
        ])
    }
    
//    func configure(item: TopImageButtonLabelCellProtocol) {
//        titleLabel.text = item.titleString
//        imageView.loadImage(url: item.imageString)
//    }
    
    func configure(item: HomeProductResult){
        imageView.loadImage(url: item.photoLink )
        titleLabel.text = item.name
        kolleksiyaLabel.text = "kolleksiya1"
        originalPriceLabel.text = item.originalPrice
        saledPriceLabel.text = item.discountPrice
    }
}
