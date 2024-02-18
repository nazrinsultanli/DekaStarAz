//
//  FilterPageTitleButtonCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 08.02.24.
//


import UIKit

class FilterPageTitleButtonCell: UICollectionViewCell {

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
//            button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
            
            // Change the target to self
            button.addTarget(self, action: #selector(didChecked), for: .touchUpInside)
            
            button.contentMode = .scaleAspectFit
            return button
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

    @objc func didChecked() {
        stateButton = stateButton ? false : true
        if stateButton{
            checkButton.setBackgroundImage(UIImage(systemName: "checkmark.square.fill"), for: .normal)
        }
        else{
            checkButton.setBackgroundImage(UIImage(systemName: "checkmark.square"), for: .normal)
        }
//        checkButton.setImage(UIImage(systemName: "checkmark.square.fill"), for: .selected)
        
        filterBuilder?.inStock = stateButton
        checkButton.backgroundColor = .red
    }
    private func configureConstraints() {
        contentView.addSubview(filterNameLabel)
        contentView.addSubview(checkButton)

        
        NSLayoutConstraint.activate([
            filterNameLabel.topAnchor.constraint(equalTo: topAnchor),
            filterNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            //filterNameLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            filterNameLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            
            checkButton.topAnchor.constraint(equalTo: topAnchor),
            checkButton.leadingAnchor.constraint(equalTo: filterNameLabel.trailingAnchor),
//            disclosureIndicator.trailingAnchor.constraint(equalTo: trailingAnchor),
            checkButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            checkButton.widthAnchor.constraint(equalToConstant: 50),
            checkButton.trailingAnchor.constraint(equalTo: trailingAnchor)
            
        ])
    }
    func configure(item: String){
        filterNameLabel.text = item
    }
}

