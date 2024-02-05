//
//  CategoryViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class CategoryViewController: UIViewController {
    
    var homeItemsType: HomePageItemType?
    var viewModel = CategoryViewModel()
    
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
    private func configureViewModel() {
        viewModel.getCategoryItem()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
        }
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
        viewModel.categoryItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeKolleksiyaCell.reuseID, for: indexPath) as! HomeKolleksiyaCell
        cell.configure(item: viewModel.categoryItems[indexPath.item])
        return cell
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width-20, height: 260)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 20, bottom: 0, right: 20)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ProductsViewController()
        controller.viewModel.categorySlugId = viewModel.categoryItems[indexPath.item].slugId
        controller.viewModel.homeItemsType = .category
        navigationController?.show(controller, sender: nil)
    }
}
