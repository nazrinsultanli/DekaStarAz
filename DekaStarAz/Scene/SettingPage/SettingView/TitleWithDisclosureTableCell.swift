//
//  TitleWithDisclosureTableCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import UIKit


class TitleWithDisclosureTableCell: UITableViewCell {
    static let reuseID = "TitleWithDisclosureTableCell"
    
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
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
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configureConstraints() {
        contentView.addSubview(filterNameLabel)
        contentView.addSubview(disclosureIndicator)
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            filterNameLabel.trailingAnchor.constraint(equalTo: disclosureIndicator.leadingAnchor, constant: -10),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            disclosureIndicator.centerYAnchor.constraint(equalTo: centerYAnchor),
            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            disclosureIndicator.widthAnchor.constraint(equalToConstant: 20),
            disclosureIndicator.heightAnchor.constraint(equalToConstant: 20),
        ])
    }
    
    func configure(item: String) {
        filterNameLabel.text = item
    }
}
