//
//  ProductDetailedHeader.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 04.02.24.
//

import UIKit

class ProductDetailedHeader: UICollectionReusableView {
 
    static let reuseID = "ProductDetailedHeader"
    var singleProduct: ProductModel?
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.isPagingEnabled = true
        collection.register(ProductDetailedHeaderCell.self,
                            forCellWithReuseIdentifier: ProductDetailedHeaderCell.reuseID)
        
        return collection
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
    
    private func configureContraints() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor )
        ])
        
    }
    
}
// 
//extension ProductDetailedHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        singleProduct?.images?.count ?? 0
//    }
//    
//    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailedHeaderCell.reuseID, for: indexPath) as! ProductDetailedHeaderCell
//        if let image = singleProduct?.images?[indexPath.row] {
//            cell.configure(item: image)
//        }
//        
//        return cell
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        .init(width: collectionView.frame.width, height: collectionView.frame.height)
//    }
//    
//    
//}

extension ProductDetailedHeader: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
           singleProduct?.images?.count ?? 0
       }
   
       func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
           let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailedHeaderCell.reuseID, for: indexPath) as! ProductDetailedHeaderCell
           if let image = singleProduct?.images?[indexPath.row] {
               cell.configure(item: image)
           }
   
           return cell
       }
       func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
           .init(width: collectionView.frame.width, height: collectionView.frame.height)
       }
}
