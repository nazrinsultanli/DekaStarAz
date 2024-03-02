//
//  FilterPagaCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import UIKit

class FilterPagaCell: UITableViewCell {
    static let reuseID = "FilterPagaCell"
    
    private let filterNameLabel: UILabel = {
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
        contentView.backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureConstraints() {
        contentView.addSubview(filterNameLabel)
        contentView.addSubview(disclosureIndicator)
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            filterNameLabel.trailingAnchor.constraint(equalTo: disclosureIndicator.leadingAnchor, constant: -8),
            
            disclosureIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            disclosureIndicator.widthAnchor.constraint(equalToConstant: 20),
            disclosureIndicator.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    func configure(item: String) {
        filterNameLabel.text = item
    }
}
