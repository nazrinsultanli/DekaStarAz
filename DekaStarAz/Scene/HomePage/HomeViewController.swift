//
//  HomeViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class HomeViewController: UIViewController {
    
    
    let searchBar = UISearchBar()
    
    var viewModel = HomeViewModel()
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        
        collection.register(HomeCollectionCell.self,
                            forCellWithReuseIdentifier: HomeCollectionCell.reuseID)
        collection.register(HomeBannerView.self,
                            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                            withReuseIdentifier: HomeBannerView.reuseID)
        layout.estimatedItemSize = .zero
        return collection
    }()
    
    private func configureViewModel(){
        viewModel.getBanners()
        viewModel.getAllHomeItems()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
            let alert = UIAlertController(title: "Error:", message: "\(errorMessage)", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        viewModel.success =  {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
    private func configureUI() {
        view.backgroundColor = UIColor(named: "backgroundColor")
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.tintColor = UIColor(named: "BlackWhite") // black
        searchBar.barTintColor = UIColor(named: "BlackWhite") // black
        
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "listTitle".localized
        navigationController?.navigationBar.tintColor = .systemIndigo
        
        if let searchTextField = searchBar.value(forKey: "searchField") as? UITextField {
            searchTextField.textColor = UIColor(named: "BlackWhite") // black
            if let placeholderLabel = searchTextField.value(forKey: "placeholderLabel") as? UILabel {
                placeholderLabel.textColor = UIColor(named: "BlackWhite") // black
            }
        }
        
        showSearchBarButton(shouldShow: true)
        self.hideKeyboardWhenTappedAround()
    }
    
    
    func showSearchBarButton(shouldShow: Bool) {
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(searchButton))
        } else {
            navigationItem.rightBarButtonItem = nil
        }
    }
    func search(shouldShow: Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
    
    @objc func searchButton() {
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
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
        .init(width: collectionView.frame.width, height: 220)
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
            
            let coordinator = ProductsViewCoordinator(categorySlugId: item,
                                                      homeItemsType: itemType,
                                                      searchText: nil,
                                                      navigationController: navigationController ?? UINavigationController())
            coordinator.start()
        }
        else {
            let coordinator = ProductDetailedViewCoordinator(slug: item, navigationController: navigationController ?? UINavigationController())
            coordinator.start()
        }
    }
    
    func didSelectSeeAll(itemType: HomePageItemType) {
        if itemType == .category {
            let controller = CategoryViewController()
            controller.homeItemsType = itemType
            tabBarController?.selectedIndex = 1
        }
        else {
            let coordinator = ProductsViewCoordinator(categorySlugId: "",
                                                      homeItemsType: itemType,
                                                      searchText: nil,
                                                      navigationController: navigationController ?? UINavigationController())
            coordinator.start()
        }
    }
}


extension HomeViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        let coordinator = ProductsViewCoordinator(categorySlugId: "",
                                                  homeItemsType: nil,
                                                  searchText: searchBar.text ?? "",
                                                  navigationController: navigationController ?? UINavigationController())
        coordinator.start()
    }
}
