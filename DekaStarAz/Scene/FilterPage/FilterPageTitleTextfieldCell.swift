//
//  FilterPageTitleTextfield.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 08.02.24.
//

import UIKit

class FilterPageTitleTextfieldCell: UICollectionViewCell {

    static let reuseID = "FilterPageTitleTextfieldCell"
    
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let priceField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "min qiymet"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        return textField
    }()
    
    private let priceUnit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "AZN"
        label.numberOfLines = 0
        return label
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
        contentView.addSubview(priceField)
        contentView.addSubview(priceUnit)
        filterNameLabel.backgroundColor = .red
        
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            //filterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            priceField.topAnchor.constraint(equalTo: topAnchor),
            priceField.leadingAnchor.constraint(equalTo: filterNameLabel.trailingAnchor),
//            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceField.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceField.widthAnchor.constraint(equalToConstant: 100),
            
            priceUnit.topAnchor.constraint(equalTo: topAnchor),
            priceUnit.leadingAnchor.constraint(equalTo: priceField.trailingAnchor),
//            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceUnit.bottomAnchor.constraint(equalTo: bottomAnchor),
            priceUnit.widthAnchor.constraint(equalToConstant: 40),
            priceUnit.trailingAnchor.constraint(equalTo: trailingAnchor)
            
            
            
        ])
    }
    func configure(item: String){
        filterNameLabel.text = item
    }
}
