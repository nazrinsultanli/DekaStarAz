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
        whiteBack.backgroundColor = UIColor(named: "CellBackground")
        whiteBack.layer.cornerRadius = 10
//        whiteBack.backgroundColor = .red
       // whiteBack.layer.borderWidth = 1
        return whiteBack
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
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let kolleksiyaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 12)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let originalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    
    private let saledPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 10)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.textColor = .black
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        contentView.backgroundColor = .clear
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
            
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 4),
            titleLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 4),
            titleLabel.trailingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 0),
           // titleLabel.heightAnchor.constraint(equalToConstant: 16),
            
            kolleksiyaLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 2),
            kolleksiyaLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 4),
            kolleksiyaLabel.trailingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 0),
            kolleksiyaLabel.heightAnchor.constraint(equalToConstant: 16),
            
            originalPriceLabel.topAnchor.constraint(equalTo: kolleksiyaLabel.bottomAnchor, constant: 0),
            originalPriceLabel.leadingAnchor.constraint(equalTo: imageView.leadingAnchor, constant: 4),
            originalPriceLabel.heightAnchor.constraint(equalToConstant: 16),
            originalPriceLabel.widthAnchor.constraint(equalToConstant: 70),
            
            saledPriceLabel.topAnchor.constraint(equalTo: kolleksiyaLabel.bottomAnchor, constant: 0),
            saledPriceLabel.leadingAnchor.constraint(equalTo: originalPriceLabel.trailingAnchor, constant: 2),
            saledPriceLabel.trailingAnchor.constraint(equalTo: kolleksiyaLabel.trailingAnchor, constant: 0),
            saledPriceLabel.heightAnchor.constraint(equalToConstant: 16),
            
        ])
    }
    
    func configure(item: HomePagesItemsProtocols){
        imageView.loadImage(url: item.photoLink)
        titleLabel.text = item.titleText
        kolleksiyaLabel.text = item.collectionName
        
        if item.discountId == 0 {
            originalPriceLabel.text = "\(String(describing: item.originalPrice)) AZN"
            saledPriceLabel.isHidden = true
        } else{
            originalPriceLabel.attributedText = "\(String(describing: item.originalPrice)) AZN".strikeThrough()
            saledPriceLabel.isHidden = false
            saledPriceLabel.text = "\(String(describing: item.saledPrice)) AZN"
        }
    }
}


