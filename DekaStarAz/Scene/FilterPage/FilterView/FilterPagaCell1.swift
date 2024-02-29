//
//  FilterPagaCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 05.02.24.
//

import UIKit

class FilterPagaCell1: UICollectionViewCell {
    static let reuseID = "FilterPagaCell1"
    
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let originalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let disclosureIndicator: UIImageView = {
         let imageView = UIImageView(image: UIImage(systemName: "chevron.right"))
         imageView.tintColor = .gray
        imageView.contentMode = .center
         imageView.translatesAutoresizingMaskIntoConstraints = false
         return imageView
     }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }


    private func configureConstraints() {
      

        contentView.addSubview(filterNameLabel)
        contentView.addSubview(disclosureIndicator)
       // filterNameLabel.backgroundColor = .red
        
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            //filterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            disclosureIndicator.topAnchor.constraint(equalTo: topAnchor, constant: 20),
            disclosureIndicator.leadingAnchor.constraint(equalTo: filterNameLabel.trailingAnchor),
            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            disclosureIndicator.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20),
            disclosureIndicator.widthAnchor.constraint(equalToConstant: 20),
            
            
            
        ])
    }
    func configure(item: String){
        filterNameLabel.text = item
    }
}
