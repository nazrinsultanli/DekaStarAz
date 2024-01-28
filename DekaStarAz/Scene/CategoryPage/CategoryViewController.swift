//
//  CategoryViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var homeItemsType: HomePageItemType?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        
        collection.register(HomeKolleksiyaCell.self,
                            forCellWithReuseIdentifier: HomeKolleksiyaCell.reuseID)
       
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        title = "Kateqoriya"
        view.backgroundColor = .systemGray4
        
    }
    private func configureViewModel(){
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    private func configureConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
    }

}

extension CategoryViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //MARK: Collection view for rest Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       15
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        switch homeItemsType {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeKolleksiyaCell.reuseID, for: indexPath) as! HomeKolleksiyaCell
            cell.backgroundColor = .red
            return cell
        default:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeKolleksiyaCell.reuseID, for: indexPath) as! HomeKolleksiyaCell
            cell.backgroundColor = .red
            return cell
            
        }
        
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-20, height: 260)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsets.init(top: 10, left: 10, bottom: 0, right: 10)
        
    }
    
   
}


