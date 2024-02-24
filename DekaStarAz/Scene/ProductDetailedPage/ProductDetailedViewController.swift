//
//  ProductDetailedViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import UIKit

class ProductDetailedViewController: UIViewController{
    
    var viewModel = ProductDetailedViewModel()
    
    let filemManager = FileManagerHelper()
    var dataFromFile = [ProductModel]()
  

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
        return collection
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
        
        filemManager.readDataFromFile { items in
            dataFromFile = items
            filemManager.writeDataToFile(products: [])
        }
    }
    
 
    
    private func configureUI() {
        title = "Products"
        view.backgroundColor = .systemGray4
        
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
    func didTapBFavorite(state: Bool) {
        if state {
            if let itemToWrite = viewModel.singleProduct {
                if dataFromFile.isEmpty {
                    dataFromFile.append(itemToWrite)
                } else {
                    if !(dataFromFile.contains(where: { $0.slug == itemToWrite.slug })) {
                        dataFromFile.append(itemToWrite)
                    }
                }
                filemManager.writeDataToFile(products: dataFromFile)
            }
        }
    }
}
