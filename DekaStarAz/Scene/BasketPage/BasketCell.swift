//
//  BasketCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.02.24.
//

import UIKit

class BasketCell: UITableViewCell {

    static let reuseID =  "BasketCell"

    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var modelNameLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    lazy var collectionLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var originalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    lazy var discountedPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func configureConstraint() {
        addSubview(photo)
        addSubview(modelNameLabel)
        addSubview(collectionLabel)
        addSubview(originalPriceLabel)
        addSubview(discountedPriceLabel)
   
//        modelNameLabel.backgroundColor = .red
//        collectionLabel.backgroundColor = .yellow
//        originalPriceLabel.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            photo.widthAnchor.constraint(equalToConstant: 150),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            modelNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            modelNameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 4),
            modelNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            modelNameLabel.heightAnchor.constraint(equalToConstant: 20),
            
            collectionLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor),
            collectionLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 4),
            collectionLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
//            collectionLabel.heightAnchor.constraint(equalToConstant: 20),
            
            originalPriceLabel.topAnchor.constraint(equalTo: collectionLabel.bottomAnchor),
            originalPriceLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 4),
            originalPriceLabel.widthAnchor.constraint(equalToConstant: 80),
            //originalPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            originalPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            discountedPriceLabel.topAnchor.constraint(equalTo: collectionLabel.bottomAnchor),
            discountedPriceLabel.leadingAnchor.constraint(equalTo: originalPriceLabel.trailingAnchor),
            discountedPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
           // discountedPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            discountedPriceLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    func configure(data: CartModel) {
//        photo.loadImage(url: data.imageFeatureURL  ?? "")
        photo.backgroundColor = .red
        modelNameLabel.text = data.price
        collectionLabel.text = data.productQuantityType
        
//        if data.discount == 0 {
//            originalPriceLabel.text = "\(String(describing: data.regularPrice ?? "")) AZN"
//            discountedPriceLabel.isHidden = true
//           
//        } else{
//            originalPriceLabel.attributedText = "\(String(describing: data.regularPrice ?? "")) AZN".strikeThrough()
//            discountedPriceLabel.text = "\(String(describing: data.discountPrice ?? "")) AZN"
//        }
       
    }
}

