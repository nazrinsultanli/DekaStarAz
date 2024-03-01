//
//  ProductDetailedViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import UIKit

class ProductDetailedViewController: UIViewController{
    
    var viewModel = ProductDetailedViewModel()
    var productQuantity: Int = 0
    let filemManager = FileManagerHelper()
    var favoriteDataFromFile: [ProductModel] = []
    var basketDataFromFile: [ProductModel] = []
  

    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(ProductDetailedCell.self,
                            forCellWithReuseIdentifier: ProductDetailedCell.reuseID)
        collection.register(ProductDetailedHeader.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: ProductDetailedHeader.reuseID)
        collection.register(ProductDetailedFooter.self,
                           forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter,
                            withReuseIdentifier: ProductDetailedFooter.reuseID)
        collection.backgroundColor = .clear
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()

        filemManager.readDataFromFile(fileSelection: .favorite) { (items: [ProductModel]?) in
            if let items = items {
                self.favoriteDataFromFile = items
            } else {
                print("Failed to read products from file.")
            }
        }
        
        filemManager.readDataFromFile(fileSelection: .basket) { (items: [ProductModel]?) in
            if let items = items {
                self.basketDataFromFile = items
            } else {
                print("Failed to read products from file.")
            }
        }
    }
    
 
    
    private func configureUI() {
        title = "Products"
        view.backgroundColor = .white
        
    }
    private func configureViewModel() {
        viewModel.getSingleProduct()
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


extension  ProductDetailedViewController:  UICollectionViewDataSource, UICollectionViewDelegate , UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ProductDetailedCell.reuseID, for: indexPath) as! ProductDetailedCell
        if let item = viewModel.singleProduct {
            cell.configure(item: item)
            cell.delegate = self
            cell.indexPath = indexPath
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width-30, height: collectionView.frame.height)
    }
  
    
    //MARK: HEADER View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "\(ProductDetailedHeader.self)",
                                                                         for: indexPath) as! ProductDetailedHeader
            header.singleProduct = viewModel.singleProduct
            return header
        }
        else {
            let footerView = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "\(ProductDetailedFooter.self)",
                                                                         for: indexPath) as! ProductDetailedFooter
            footerView.delegate = self
            return footerView
        }
    }
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.size.width, height: view.frame.size.width*2/3)
    }
    
    //MARK: Footer View
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        CGSize(width: view.frame.size.width, height: 100)
    }
}

extension ProductDetailedViewController: ProductDetailFooterDelagate {
    func didTapBasket(state: Bool) {
        if state {
            if let itemToWrite = viewModel.singleProduct {
                var item = itemToWrite
                item.userQuantity = productQuantity
                if basketDataFromFile.isEmpty {
                    basketDataFromFile.append(item)
                } else {
//                    if !(basketDataFromFile.contains(where: { $0.slug == item.slug })) {
//                        basketDataFromFile.append(item)
//                    }
                    
                    if let index = basketDataFromFile.firstIndex(where: { $0.slug == item.slug }) {
                        basketDataFromFile[index] = item
                    } else {
                        basketDataFromFile.append(item)
                    }
                }
                filemManager.writeDataToFile(data: basketDataFromFile, fileSelection: .basket)
            }
        }
    }
    
    func didTapBFavorite(state: Bool) {
        if state {
            if let itemToWrite = viewModel.singleProduct {
                if favoriteDataFromFile.isEmpty {
                    favoriteDataFromFile.append(itemToWrite)
                } else {
                    if !(favoriteDataFromFile.contains(where: { $0.slug == itemToWrite.slug })) {
                        favoriteDataFromFile.append(itemToWrite)
                    }
                }
                filemManager.writeDataToFile(data: favoriteDataFromFile, fileSelection: .favorite)
            }
        }
    }
}


extension ProductDetailedViewController: TextFieldProductDetailCellDelegate {
    func textFieldDidEndEditing(_ text: String) {
        productQuantity = Int(text) ?? 0
        print("Entered text at indexPath : \(text)")
    }
    
  
  
    

}
