//
//  ProductDetailedFooterView.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import UIKit

class ProductDetailedFooter: UITableViewHeaderFooterView {

    static let reuseID = "ProductDetailedFooter"
    
    private lazy var addToBasketButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Baskete Elave Et", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    
    override init(reuseIdentifier: String?) {
          super.init(reuseIdentifier: reuseIdentifier)
        configureContraints()
      }
      
      required init?(coder: NSCoder) {
          super.init(coder: coder)
          // Implement initialization from storyboard or nib
          configureContraints()
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
        
        NSLayoutConstraint.activate([
            addToBasketButton.topAnchor.constraint(equalTo: topAnchor),
            addToBasketButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            addToBasketButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            addToBasketButton.bottomAnchor.constraint(equalTo: bottomAnchor )
        ])
        
    }
    
}
