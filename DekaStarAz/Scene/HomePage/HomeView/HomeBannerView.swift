//
//  HomeBannerView.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 24.01.24.
//

import UIKit

class HomeBannerView: UICollectionReusableView {
    static let reuseID = "HomeBannerView"
    var bannerItemsReusableView = [BannerModel]()
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
        collection.backgroundColor = .clear
        collection.register(HomeBannerCell.self,
                            forCellWithReuseIdentifier: HomeBannerCell.reuseID)
        
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
 
extension HomeBannerView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        bannerItemsReusableView.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeBannerCell.reuseID, for: indexPath) as! HomeBannerCell
        cell.configure(item: bannerItemsReusableView[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    
}
