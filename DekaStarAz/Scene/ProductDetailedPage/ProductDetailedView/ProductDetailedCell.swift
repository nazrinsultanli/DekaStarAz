//
//  ProductDetailedCell1.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import UIKit

protocol TextFieldProductDetailCellDelegate: AnyObject {
    func textFieldDidEndEditing(_ text: String)
}


class ProductDetailedCell: UICollectionViewCell {
    static let reuseID = "ProductDetailedCell"
    weak var delegate: TextFieldProductDetailCellDelegate?
    var indexPath: IndexPath?
    private let modelNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        //label.font = UIFont.boldSystemFont(ofSize: 18)
        label.font = .systemFont(ofSize: 22, weight: .heavy)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let originalPriceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let discountedPriceLAbel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .heavy)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let kodText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Kod"
        return label
    }()
    private let kodLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let kateqoriyaText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Kateqoriya"
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
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Kolleksiya"
        return label
    }()
    private let kolleksiyaLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let movcudluqText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Movcudluq"
        return label
    }()
    private let movcudluqLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let sayText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Miqdar"
        return label
    }()
    private let sayTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Say"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        textField.autocorrectionType = .no
        textField.keyboardType = .numberPad
        textField.returnKeyType = .done
        textField.clearButtonMode = .whileEditing
        textField.backgroundColor = .clear
        return textField
    }()
    
    private let unitLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "m2"
        return label
    }()
    private let decriptionText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.text = "Mezmun"
        return label
    }()
    private let descriptionScrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.backgroundColor = .clear
        return scrollView
    }()
    
    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.setContentCompressionResistancePriority(.required, for: .vertical)
        label.setContentHuggingPriority(.required, for: .vertical)
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.5 
//        label.preferredMaxLayoutWidth = 100 
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        sayTextField.delegate = self
        configureConstraints()
        self.hideKeyboardWhenTappedAround()
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
        sayUnit.spacing = 10
        
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
        
        contentView.addSubview(modelNameLabel)
        contentView.addSubview(originalPriceLabel)
        contentView.addSubview(discountedPriceLAbel)
        contentView.addSubview(generalStack)
        contentView.addSubview(decriptionText)
        contentView.addSubview(descriptionScrollView)
//        contentView.addSubview(descriptionLabel)
        self.descriptionScrollView.addSubview(descriptionLabel)
//        descriptionScrollView.backgroundColor = .purple
//        descriptionLabel.backgroundColor = .lightGray
        
        NSLayoutConstraint.activate([
            unitLabel.widthAnchor.constraint(equalToConstant: 100),
            modelNameLabel.topAnchor.constraint(equalTo: topAnchor),
            modelNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            modelNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            modelNameLabel.heightAnchor.constraint(equalToConstant: 40),
            
            originalPriceLabel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor),
            originalPriceLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            originalPriceLabel.heightAnchor.constraint(equalToConstant: 30),
            originalPriceLabel.widthAnchor.constraint(equalToConstant: 120),
            
            discountedPriceLAbel.topAnchor.constraint(equalTo: modelNameLabel.bottomAnchor),
            discountedPriceLAbel.leadingAnchor.constraint(equalTo: originalPriceLabel.trailingAnchor),
            discountedPriceLAbel.trailingAnchor.constraint(equalTo: trailingAnchor),
            discountedPriceLAbel.heightAnchor.constraint(equalToConstant: 30),
            
            kodText.widthAnchor.constraint(equalToConstant: 120),
            kateqoriyaText.widthAnchor.constraint(equalToConstant: 120),
            kolleksiyaText.widthAnchor.constraint(equalToConstant: 120),
            movcudluqText.widthAnchor.constraint(equalToConstant: 120),
            sayText.widthAnchor.constraint(equalToConstant: 120),
            sayTextField.widthAnchor.constraint(equalToConstant: 80),
            
            generalStack.topAnchor.constraint(equalTo: originalPriceLabel.bottomAnchor),
            generalStack.leadingAnchor.constraint(equalTo: leadingAnchor),
            generalStack.trailingAnchor.constraint(equalTo: trailingAnchor),
            generalStack.heightAnchor.constraint(equalToConstant: 180),
            
            decriptionText.topAnchor.constraint(equalTo: generalStack.bottomAnchor, constant: 10),
            decriptionText.leadingAnchor.constraint(equalTo: leadingAnchor),
            decriptionText.trailingAnchor.constraint(equalTo: trailingAnchor),
            decriptionText.heightAnchor.constraint(equalToConstant: 30),
//            decriptionText.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            descriptionScrollView.topAnchor.constraint(equalTo: decriptionText.bottomAnchor),
            descriptionScrollView.leadingAnchor.constraint(equalTo: leadingAnchor),
            descriptionScrollView.trailingAnchor.constraint(equalTo: trailingAnchor),
            descriptionScrollView.heightAnchor.constraint(equalToConstant: 250),
//            descriptionScrollView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
            descriptionLabel.topAnchor.constraint(equalTo: descriptionScrollView.topAnchor),
            descriptionLabel.leadingAnchor.constraint(equalTo: descriptionScrollView.leadingAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: descriptionScrollView.trailingAnchor),
            descriptionLabel.bottomAnchor.constraint(equalTo: descriptionScrollView.bottomAnchor),
            descriptionLabel.widthAnchor.constraint(equalTo: descriptionScrollView.widthAnchor),
//            descriptionLabel.heightAnchor.constraint(equalTo: descriptionScrollView.heightAnchor),
            ])
    }
    
    func configure(item: ProductModel){
        modelNameLabel.text = item.name
        kodLabel.text = item.code
        kateqoriyaLabel.text = item.collection?.category?.categoryName
        kolleksiyaLabel.text = item.collection?.name
        movcudluqLabel.text = item.inStockDisplayValue
        descriptionLabel.attributedText = item.information?.htmlToAttributedString
        
        if item.discount == 0 {
            originalPriceLabel.text = "\(String(describing: item.regularPrice ?? "")) AZN"
            discountedPriceLAbel.isHidden = true
        } else{
            originalPriceLabel.attributedText = "\(String(describing: item.regularPrice ?? "")) AZN".strikeThrough()
            discountedPriceLAbel.text = "\(String(describing: item.discountPrice ?? "")) AZN"
        }
        unitLabel.text = item.quantityType?.lowercased()
    }
}

extension ProductDetailedCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        if let text = sayTextField.text {
            delegate?.textFieldDidEndEditing(text)
        }
    }
}

