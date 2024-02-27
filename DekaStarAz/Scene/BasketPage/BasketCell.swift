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
        label.font = .systemFont(ofSize: 16, weight: .bold)
        return label
    }()
    
    lazy var codeLabel: UILabel = {
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
    
    private let quantityTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Say"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        return textField
    }()
    
    lazy var unitLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    lazy var totalText: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = .black
        label.text = "Total:"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 12, weight: .medium)
        return label
    }()
    
    lazy var totalLabel: UILabel = {
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
        addSubview(codeLabel)
        addSubview(originalPriceLabel)
        addSubview(discountedPriceLabel)
        addSubview(quantityTextField)
        addSubview(unitLabel)
        addSubview(totalText)
        addSubview(totalLabel)
   
//        modelNameLabel.backgroundColor = .red
//        codeLabel.backgroundColor = .yellow
//        unitLabel.backgroundColor = .green
        
        NSLayoutConstraint.activate([
            //MARK: photo
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            photo.widthAnchor.constraint(equalToConstant: 100),
            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            //MARK: Model
            modelNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            modelNameLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            modelNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            modelNameLabel.heightAnchor.constraint(equalToConstant: 30),
            
            //MARK: code
            codeLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor),
            codeLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            codeLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            codeLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //MARK: quantity
            quantityTextField.topAnchor.constraint(equalTo: codeLabel.bottomAnchor),
            quantityTextField.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            quantityTextField.widthAnchor.constraint(equalToConstant: 80),
            quantityTextField.heightAnchor.constraint(equalToConstant: 20),
            
            unitLabel.topAnchor.constraint(equalTo: codeLabel.bottomAnchor),
            unitLabel.leadingAnchor.constraint(equalTo: quantityTextField.trailingAnchor, constant: 10),
            unitLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            unitLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //MARK: price
            originalPriceLabel.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor),
            originalPriceLabel.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            originalPriceLabel.widthAnchor.constraint(equalToConstant: 80),
            originalPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            discountedPriceLabel.topAnchor.constraint(equalTo: quantityTextField.bottomAnchor),
            discountedPriceLabel.leadingAnchor.constraint(equalTo: originalPriceLabel.trailingAnchor, constant: 10),
            discountedPriceLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 8),
            discountedPriceLabel.heightAnchor.constraint(equalToConstant: 20),
            
            //MARK: price
            totalText.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor),
            totalText.leadingAnchor.constraint(equalTo: photo.trailingAnchor, constant: 10),
            totalText.widthAnchor.constraint(equalToConstant: 80),
            totalText.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            totalLabel.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor),
            totalLabel.leadingAnchor.constraint(equalTo: totalText.trailingAnchor),
            totalLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            totalLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
        ])
    }
    
    
    func configure(data: ProductModel) {
        photo.loadImage(url: data.imageFeatureURL  ?? "")
        modelNameLabel.text = data.name
        codeLabel.text = data.code
        unitLabel.text = data.quantityType
        quantityTextField.placeholder = "\(String(describing: data.userQuantity ?? 0 ))"
        
        if data.discount == 0 {
            originalPriceLabel.text = "\(String(describing: data.regularPrice ?? "")) AZN"
            discountedPriceLabel.isHidden = true
           
        } else{
            originalPriceLabel.attributedText = "\(String(describing: data.regularPrice ?? "")) AZN".strikeThrough()
            discountedPriceLabel.text = "\(String(describing: data.discountPrice ?? "")) AZN"
        }
       
    }
}

