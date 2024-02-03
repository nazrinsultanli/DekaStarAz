//
//  HomeViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class HomeViewController: UIViewController {
    var viewModel = HomeViewModel()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        
        collection.register(HomeCollectionCell.self,
                            forCellWithReuseIdentifier: HomeCollectionCell.reuseID)
        collection.register(HomeBannerView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HomeBannerView.reuseID)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    @objc func searchButton() {
        let cv = CategoryViewController()
        navigationController?.show(cv, sender: nil)
    }
    private func configureViewModel(){
        viewModel.getBanners()
        viewModel.getAllHomeItems()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
        }
        
        
    }
    private func configureUI() {
        navigationItem.title = "DEKASTAR COMPANY"
        view.backgroundColor = .white
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action:  #selector(searchButton)
        )
        
    }
    private func configureConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
    }
}


extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //MARK: Collection view for rest Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.homeItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.reuseID, for: indexPath) as! HomeCollectionCell
        let item = viewModel.homeItems[indexPath.item]
        cell.delegate = self
        cell.homeItemsType = viewModel.homeItems[indexPath.item].type
        cell.configure(title: item.title , homeItems: item.resultData, type: item.type)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 250)
    }
    
    //MARK: HEADER View
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind,
                                                                         withReuseIdentifier: "\(HomeBannerView.self)",
                                                                         for: indexPath) as! HomeBannerView
            header.bannerItemsReusableView = viewModel.bannerItems
            return header
        }
        return UICollectionReusableView()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        CGSize(width: view.frame.size.width, height: view.frame.size.width/2)
    }
}


extension HomeViewController: HomeCollectionCellDelegate {
    func didSelectProductId(item: String, itemType: HomePageItemType) {
        if itemType == .category {
            let controller = ProductsViewController()
//            controller.homeItemsType = itemType
//            tabBarController?.selectedIndex = 1
        }
        else {
            let controller = ProductDetailedViewController()
            controller.viewModel.slug = item
            navigationController?.show(controller, sender: nil)
        }
    }
    
   
    
    func didSelectSeeAll(itemType: HomePageItemType) {
        if itemType == .category {
            let controller = CategoryViewController()
            controller.homeItemsType = itemType
            tabBarController?.selectedIndex = 1
        }
        else {
            let controller = ProductsViewController()
            controller.homeItemsType = itemType
            navigationController?.show(controller, sender: nil)
        }
        
    }
    
    
//
//    func didSelectSeeAll(endpoint: MovieEndpoint) {
//        let controller = SeeAllCoordinator(navigationController: navigationController ?? UINavigationController(), endpoint: endpoint)
//        controller.start()
//    }
//    
//    func didSelectMovie(_ movie: Int) {
//        print(movie)
//        let controller = MovieDetailedCoordinator(navigationController: navigationController ?? UINavigationController(), movieID: movie)
//        controller.start()
//       }
}

