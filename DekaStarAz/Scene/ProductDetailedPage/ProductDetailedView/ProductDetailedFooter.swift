//
//  ProductDetailedFooter.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import UIKit
protocol ProductDetailFooterDelagate: AnyObject {
    func didTapBFavorite(state: Bool)
    func didTapBasket(state: Bool)
    
}

class ProductDetailedFooter: UICollectionReusableView {
    static let reuseID = "ProductDetailedFooter"
    weak var delegate: ProductDetailFooterDelagate?
    
    private lazy var addToFavoriteButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Favorite Elave Et", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemPurple
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(favButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var addToBasketButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Baskete Elave Et", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemIndigo
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(basketButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureContraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    
    @objc func buttonTapped() {
        // Handle button tap action
        print("Button tapped!")
    }
    
    private func configureContraints() {
        addSubview(addToBasketButton)
        addSubview(addToFavoriteButton)
        
        NSLayoutConstraint.activate([
            addToFavoriteButton.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            addToFavoriteButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 15),
            addToFavoriteButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15),
            addToBasketButton.heightAnchor.constraint(equalToConstant: 40),
            
            addToBasketButton.topAnchor.constraint(equalTo: addToFavoriteButton.bottomAnchor, constant: 10),
            addToBasketButton.leadingAnchor.constraint(equalTo: addToFavoriteButton.leadingAnchor),
            addToBasketButton.trailingAnchor.constraint(equalTo: addToFavoriteButton.trailingAnchor),
            addToBasketButton.bottomAnchor.constraint(equalTo: bottomAnchor ),
            
            
        ])
        
    }
     
    @objc func favButtonTapped () {
        // Change the color to green
        addToFavoriteButton.backgroundColor = .systemGreen
    
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            self.addToFavoriteButton.backgroundColor = .systemPurple
        }, completion: nil)
        delegate?.didTapBFavorite(state: true)
    }
    
    @objc func basketButtonTapped () {
        addToBasketButton.backgroundColor = .green
    
        UIView.animate(withDuration: 1.0, delay: 0, options: .curveEaseInOut, animations: {
            self.addToBasketButton.backgroundColor = .systemIndigo
        }, completion: nil)
        delegate?.didTapBasket(state: true)

    }
    
}
