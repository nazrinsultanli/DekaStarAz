//
//  FavoritePageCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 23.02.24.
//

import UIKit

class FavoritePageCell: UITableViewCell {
    static let reuseID =  "FavoritePageCell"

    lazy var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "titleLabel"
        label.numberOfLines = 1
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        return label
    }()
    
    lazy var bottomLabel: UILabel = {
        let label = UILabel()
        label.text = "bottomLabel"
        label.numberOfLines = 0
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
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
        addSubview(titleLabel)
        addSubview(bottomLabel)
        
        NSLayoutConstraint.activate([
            //hamisin secmek ucun => option + Shift + sican
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            bottomLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            bottomLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
            bottomLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            
            photo.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
            photo.leadingAnchor.constraint(equalTo: leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: bottomLabel.topAnchor, constant: -8),
            photo.heightAnchor.constraint(equalToConstant: 200)
        ])
    }
    
    func configure(data: ProductModel) {
        bottomLabel.text = data.name
        titleLabel.text = data.regularPrice
    }
}

