//
//  FilterDetailListCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 10.02.24.
//

import UIKit


class FilterDetailListCell: UITableViewCell {
    static let reuseID = "FilterDetailListCell"
    
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
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
        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: contentView.topAnchor),
            filterNameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            filterNameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }
    
    func configure(item: String) {
        filterNameLabel.text = item
    }
}
