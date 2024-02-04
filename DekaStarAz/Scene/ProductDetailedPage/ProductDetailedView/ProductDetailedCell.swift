//
//  ProductDetailedCell1.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import UIKit

class ProductDetailedCell: UICollectionViewCell {
    static let reuseID = "ProductDetailedCell"
    
    private let modelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
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
    private let discountedPriceLAbel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let kodText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Kod"
        label.backgroundColor = .brown
        return label
    }()
    private let kodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let kateqoriyaText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Kateqoriya"
        label.backgroundColor = .red
        return label
    }()
    private let kateqoriyaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let kolleksiyaText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Kolleksiya"
        label.backgroundColor = .yellow
        return label
    }()
    private let kolleksiyaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let movcudluqText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Movcudluq"
        label.backgroundColor = .cyan
        return label
    }()
    private let movcudluqLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let sayText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "say"
        return label
    }()
    private let sayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Enter text here"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        return textField
    }()
    
    private let unitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "m2"
        return label
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.text = "m2nfidbc/nfdfref/nfrefr/nfref/ngtr/ngtr/ngtr"
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
        let kodStack = UIStackView()
        kodStack.addArrangedSubview(kodText)
        kodStack.addArrangedSubview(kodLabel)
        kodStack.translatesAutoresizingMaskIntoConstraints = false
        kodStack.axis = .horizontal
        
        let kateqoriyaStack = UIStackView()
        kateqoriyaStack.addArrangedSubview(kateqoriyaText)
        kateqoriyaStack.addArrangedSubview(kateqoriyaLabel)
        kateqoriyaStack.translatesAutoresizingMaskIntoConstraints = false
        kateqoriyaStack.axis = .horizontal
        
        let kolleksiyaStack = UIStackView()
        kolleksiyaStack.addArrangedSubview(kolleksiyaText)
        kolleksiyaStack.addArrangedSubview(kolleksiyaLabel)
        kolleksiyaStack.translatesAutoresizingMaskIntoConstraints = false
        kolleksiyaStack.axis = .horizontal
        
        let movcudluqStack = UIStackView()
        movcudluqStack.addArrangedSubview(movcudluqText)
        movcudluqStack.addArrangedSubview(movcudluqLabel)
        movcudluqStack.translatesAutoresizingMaskIntoConstraints = false
        movcudluqStack.axis = .horizontal
        
        
        let sayUnit = UIStackView()
        sayUnit.addArrangedSubview(sayTextField)
        sayUnit.addArrangedSubview(unitLabel)
        sayUnit.axis = .horizontal
        sayUnit.translatesAutoresizingMaskIntoConstraints = false
        
        
        let sayStack = UIStackView()
        sayStack.addArrangedSubview(sayText)
        sayStack.addArrangedSubview(sayUnit)
        sayStack.translatesAutoresizingMaskIntoConstraints = false
        sayStack.axis = .horizontal
        
        
        let generalStack = UIStackView()
        generalStack.axis = .vertical
        generalStack.addArrangedSubview(kodStack)
        generalStack.addArrangedSubview(kateqoriyaStack)
        generalStack.addArrangedSubview(kolleksiyaStack)
        generalStack.addArrangedSubview(movcudluqStack)
        generalStack.addArrangedSubview(sayStack)
        generalStack.distribution = .fillEqually
        generalStack.translatesAutoresizingMaskIntoConstraints = false
      //  generalStack.alignment = .fill

        
        contentView.addSubview(modelNameLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(discountedPriceLAbel)
        contentView.addSubview(generalStack)
        contentView.addSubview(descriptionLabel)
        
        modelNameLabel.backgroundColor = .red
        originalPriceLabel.backgroundColor = .green
        discountedPriceLAbel.backgroundColor = .purple
//        leftStack.backgroundColor = .yellow
//        rightStack.backgroundColor = .gray
        descriptionLabel.backgroundColor = .blue
        
        NSLayoutConstraint.activate([
            
            unitLabel.widthAnchor.constraint(equalToConstant: 60),
            modelNameLabel.topAnchor.constraint(equalTo: topAnchor),
            modelNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            modelNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            modelNameLabel.heightAnchor.constraint(equalToConstant: 80),
            
            originalPriceLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor),
            originalPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            originalPriceLabel.heightAnchor.constraint(equalToConstant: 60),
            originalPriceLabel.widthAnchor.constraint(equalToConstant: 80),
            
            discountedPriceLAbel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor),
            discountedPriceLAbel.leadingAnchor.constraint(equalTo: originalPriceLabel.trailingAnchor),
            discountedPriceLAbel.trailingAnchor.constraint(equalTo: trailingAnchor),
            discountedPriceLAbel.heightAnchor.constraint(equalToConstant: 60),
            
            kodText.widthAnchor.constraint(equalToConstant: 120),
            kateqoriyaText.widthAnchor.constraint(equalToConstant: 120),
            kolleksiyaText.widthAnchor.constraint(equalToConstant: 120),
            movcudluqText.widthAnchor.constraint(equalToConstant: 120),
            sayText.widthAnchor.constraint(equalToConstant: 120),
           
            generalStack.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor),
            generalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            generalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStack.heightAnchor.constraint(equalToConstant: 300),
            

            descriptionLabel.topAnchor.constraint(equalTo: generalStack.bottomAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionLabel.heightAnchor.constraint(equalToConstant: 200),

            
            
            
            
        ])
    }
 //   */
    func configure(item: ProductModel){
        modelNameLabel.text = item.name
        originalPriceLabel.text = item.regularPrice
        discountedPriceLAbel.text = item.discountPrice
        kodLabel.text = "\(String(describing: item.id))"
        kateqoriyaLabel.text = item.collection?.category?.categoryName
        kolleksiyaLabel.text = item.collection?.name
        movcudluqLabel.text = item.inStockDisplayValue
        
    }
}
