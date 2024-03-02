//
//  TopImageButtomLabelTableCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import UIKit

class TopImageButtomLabelTableCell: UITableViewCell {
    static let reuseID = "TopImageButtomLabelTableCell"
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.textColor = UIColor(named: "BlackWhite") // black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .justified // Justify the text
        return label
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureConstraints() {
        contentView.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0),
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor), // Center horizontally
            titleLabel.leadingAnchor.constraint(greaterThanOrEqualTo: leadingAnchor, constant: 20), // Ensure leading space
            titleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor, constant: -20), // Ensure trailing space
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }

    func configure(item: SettingsPageItemsProtocols){
        titleLabel.attributedText = item.siteTextLabel.htmlToAttributedString
    }
}
