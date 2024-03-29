//
//  HomeCollectionCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 16.01.24.
//

import UIKit

//1
protocol HomeCollectionCellDelegate: AnyObject {
    func didSelectSeeAll(itemType: HomePageItemType)
    func didSelectProductId(item: String, itemType: HomePageItemType )
}

class HomeCollectionCell: UICollectionViewCell {
    //2
    weak var delegate: HomeCollectionCellDelegate?
    
    static let reuseID = "HomeCollectionCell"
    var homeItems = [HomePagesItemsProtocols]()
    var homeItemsType: HomePageItemType?
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    private let seeAllButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("Hamisina bax", for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 14, weight: .bold)
        button.setTitleColor(UIColor(named: "UniversalColor"), for: .normal)
        return button
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.backgroundColor = .clear
        collection.register(TopImageButtomLabelS.self, forCellWithReuseIdentifier: TopImageButtomLabelS.reuseID)
        collection.register(HomeKolleksiyaCell.self, forCellWithReuseIdentifier: HomeKolleksiyaCell.reuseID)
        return collection
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureConstraints()
        seeAllButton.addTarget(self, action: #selector(seeAllButtonClicked), for: .touchUpInside)
    }
    
    @objc func seeAllButtonClicked(_ sender: UIButton?) {
        delegate?.didSelectSeeAll(itemType: homeItemsType ?? .category)
    }
    
    required init?(coder: NSCoder) {
        fatalError("Init(coder:) has not been implemented")
    }
    
    func configure(title: String, homeItems: [HomePagesItemsProtocols], type: HomePageItemType) {
        titleLabel.text = title
        self.homeItems = homeItems
        self.homeItemsType = type
        collectionView.reloadData()
    }
    
    private func configureConstraints() {
        let stack = UIStackView()
        stack.addArrangedSubview(titleLabel)
        stack.addArrangedSubview(seeAllButton)
        stack.axis = .horizontal
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(stack)
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            stack.topAnchor.constraint(equalTo: topAnchor),
            stack.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            stack.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            seeAllButton.trailingAnchor.constraint(equalTo: stack.trailingAnchor),
            
            collectionView.topAnchor.constraint(equalTo: stack.bottomAnchor, constant: 16),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}

extension HomeCollectionCell:  UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        homeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = homeItems[indexPath.item]
        switch homeItemsType {
        case .category:
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeKolleksiyaCell.reuseID, for: indexPath) as? HomeKolleksiyaCell else { return UICollectionViewCell() }
            cell.configure(item: item)
            return cell
        case .recent:
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageButtomLabelS.reuseID, for: indexPath) as? TopImageButtomLabelS else { return UICollectionViewCell() }
            cell.configure(item: item)
            return cell
        case .discounted:
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageButtomLabelS.reuseID, for: indexPath) as? TopImageButtomLabelS else { return UICollectionViewCell() }
            cell.configure(item: item)
            return cell
        default:
            guard let  cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.reuseID, for: indexPath) as? HomeCollectionCell else { return UICollectionViewCell() }
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch homeItemsType {
        case .category:
                .init(width: 260, height: collectionView.frame.height)
        default:
                .init(width: 180, height: collectionView.frame.height)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.init(top: 0, left: 20, bottom: 0, right: 0)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //3
        switch homeItemsType {
        case .category:
            delegate?.didSelectProductId(item: homeItems[indexPath.item].slugId, itemType: .category ) // elebele
        default:
            delegate?.didSelectProductId(item: homeItems[indexPath.item].slugId, itemType: .discounted )
        }
    }
}
