//
//  FilterPageTitleButtonCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import UIKit
class FilterPageTitleButtonCell: UITableViewCell {

    static let reuseID = "FilterPageTitleButtonCell"
    var filterBuilder: FilterBuilder?
    var stateButton = false
    private let filterNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.addTarget(self, action: #selector(didChecked), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configureConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }

    @objc func didChecked() {
        stateButton = !stateButton
        if stateButton {
            checkButton.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        } else {
            checkButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
        filterBuilder?.inStock = stateButton
    }

    private func configureConstraints() {
        contentView.addSubview(filterNameLabel)
        contentView.addSubview(checkButton)

        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -8),
            filterNameLabel.trailingAnchor.constraint(equalTo: checkButton.leadingAnchor, constant: -8),
            
            checkButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            checkButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -25),
            checkButton.widthAnchor.constraint(equalToConstant: 20),
            checkButton.heightAnchor.constraint(equalToConstant: 20)
        ])
    }

    func configure(item: String) {
        filterNameLabel.text = item
    }
}
