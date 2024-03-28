//
//  FilterPageTitleTextfieldCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

protocol TextFieldFilterPageCellDelegate: AnyObject {
    func textFieldDidEndEditing(_ text: String)
}

import UIKit

class FilterPageTitleTextfieldCell: UITableViewCell {
    var filterType: FilterItemsNames?
    static let reuseID = "FilterPageTitleTextfieldCell"
    weak var delegate: TextFieldFilterPageCellDelegate?
    var filterBuilder: FilterBuilder?
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let priceField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "qiymet"
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
    private let priceUnit: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.text = "AZN"
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
        contentView.backgroundColor = .clear
        priceField.delegate = self
        self.hideKeyboardWhenTappedAround()
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
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            //filterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            
            priceField.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            priceField.leadingAnchor.constraint(equalTo: filterNameLabel.trailingAnchor, constant: 16),
            //            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceField.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            priceField.widthAnchor.constraint(equalToConstant: 100),
            
            priceUnit.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            priceUnit.leadingAnchor.constraint(equalTo: priceField.trailingAnchor, constant: 20),
            //            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            priceUnit.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            priceUnit.widthAnchor.constraint(equalToConstant: 40),
            priceUnit.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16) 
        ])
    }
    func configure(item: String, itemType: FilterItemsNames ){
        filterNameLabel.text = item
        filterType = itemType
    }
}


extension FilterPageTitleTextfieldCell: UITextFieldDelegate {
    func textFieldDidChangeSelection(_ textField: UITextField) {
        switch filterType {
        case .minPrice:
            filterBuilder?.minPrice = priceField.text
        case .maxPrice:
            filterBuilder?.maxPrice = priceField.text
        default:
            break
        }
    }
}
