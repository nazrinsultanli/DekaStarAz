//
//  ProductsViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 02.02.24.
//

import UIKit

class ProductsViewController: UIViewController {
    
    
    var viewModel = ProductsViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        collection.register(TopImageButtomLabelS.self,
                            forCellWithReuseIdentifier: TopImageButtomLabelS.reuseID)
        return collection
    }()

    lazy var noItems: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BlackWhite") // black
        label.text = "Mehsul Tapilmadi"
        label.textAlignment = .center
        label.isHidden = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    override func viewWillAppear(_ animated: Bool) {
//        configureViewModel()
    }
    
    private func configureUI() {
        title = "Products"
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "line.3.horizontal.decrease.circle.fill"),
            style: .done,
            target: self,
            action:  #selector(filterButton)
        )
    }
    
 
    @objc func filterButton() {
        let filterController = FilterPageController()
        filterController.filterCompleted = { [weak self] filterItemsModel in
            self?.viewModel.filterItemsInfo = filterItemsModel
            self?.viewModel.getAllItems()
        }
        navigationController?.pushViewController(filterController, animated: true)
    }

    
    private func configureViewModel() {
        viewModel.getAllItems()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            self.configureVisibility()
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
           
        }
    }

    func configureVisibility() {
        if viewModel.productsItems.isEmpty {
            noItems.isHidden = false
            collectionView.isHidden = true
        } else {
            noItems.isHidden = true
            collectionView.isHidden = false
        }
    }
    private func configureConstraints() {
        view.addSubview(collectionView)
        view.addSubview(noItems)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        
            noItems.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            noItems.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            noItems.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            noItems.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        
        ])
    }

}

extension ProductsViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //MARK: Collection view for rest Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // viewModel.categoryItems.count
        viewModel.productsItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TopImageButtomLabelS.reuseID, for: indexPath) as! TopImageButtomLabelS
        cell.configure(item: viewModel.productsItems[indexPath.item])
        return cell
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width/2-20, height: 180)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
        .init(top: 10, left: 10, bottom: 0, right: 10)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ProductDetailedViewController()
        controller.viewModel.slug = viewModel.productsItems[indexPath.item].slug
        navigationController?.show(controller, sender: nil)
    }
}
