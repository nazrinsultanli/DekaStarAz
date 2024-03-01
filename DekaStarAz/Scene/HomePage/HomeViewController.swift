//
//  HomeViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class HomeViewController: UIViewController {
    private var dropdownMenu: DropdownMenu? // MARK: dropdown
    
    let searchBar = UISearchBar()
    
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
        layout.estimatedItemSize = .zero
        return collection
    }()

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
    
    override func viewDidLoad() {
            super.viewDidLoad()
            configureUI()
            configureConstraints()
            configureViewModel()
        }

    private func configureUI() {
//        navigationItem.title = "listTitle".localized
        view.backgroundColor = .white
        // configureDrowDownMenu()
        
        searchBar.sizeToFit()
        searchBar.delegate = self
        searchBar.tintColor = .white
        searchBar.barTintColor = .white
        searchBar.backgroundColor = .white
        
//
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.title = "listTitle".localized
        navigationController?.navigationBar.barTintColor = UIColor(red: 55/255, green: 120/255, blue: 250/255, alpha: 1)
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.tintColor = .white
        showSearchBarButton(shouldShow: true)
        
        
        
//        navigationItem.rightBarButtonItem = UIBarButtonItem(
//            image: UIImage(systemName: "magnifyingglass"),
//            style: .done,
//            target: self,
//            action:  #selector(searchButton)
//        )
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
//        let cv = ProductsViewController()
//        navigationController?.show(cv, sender: nil)
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
    }
    
    func configureDrowDownMenu() {  // MARK: dropdown
        let dropdownButton = UIButton(type: .custom)
        dropdownButton.setTitle("Language", for: .normal)
        dropdownButton.setTitleColor(.black, for: .normal)
        dropdownButton.addTarget(self, action: #selector(dropdownButtonTapped(sender:)), for: .touchUpInside)

        let dropdownMenu = DropdownMenu(items: ["az", "en", "ru"])
        dropdownMenu.delegate = self
        dropdownMenu.isHidden = true
        view.addSubview(dropdownMenu)
        self.dropdownMenu = dropdownMenu

        let dropdownBarButtonItem = UIBarButtonItem(customView: dropdownButton)
        navigationItem.rightBarButtonItem = dropdownBarButtonItem
    }


    
    @objc func dropdownButtonTapped(sender: UIButton) {  // MARK: dropdown
        guard let dropdownMenu = dropdownMenu else { return }
        dropdownMenu.isHidden = !dropdownMenu.isHidden

        if dropdownMenu.isHidden {
            dropdownMenu.removeFromSuperview()
        } else {
            if let superview = sender.superview, let navigationBar = navigationController?.navigationBar {
                let origin = CGPoint(x: navigationBar.frame.origin.x + navigationBar.frame.size.width - dropdownMenu.frame.size.width, y: navigationBar.frame.origin.y + navigationBar.frame.size.height)
                dropdownMenu.frame.origin = origin
                dropdownMenu.frame.size = CGSize(width: 100, height: 120)
                view.addSubview(dropdownMenu)
            }
        }
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
            let controller = ProductsViewController()
            controller.viewModel.categorySlugId = item
            controller.viewModel.homeItemsType = itemType
            navigationController?.show(controller, sender: nil)
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
            controller.viewModel.homeItemsType  = itemType
            navigationController?.show(controller, sender: nil)
        }
        
    }
    
}
extension HomeViewController: DropdownMenuDelegate {  // MARK: dropdown
    func didSelectItem(item: String) {
        // Update the title of the dropdownButton
        if let customView = navigationItem.rightBarButtonItem?.customView as? UIButton {
            customView.setTitle(item, for: .normal)
        }

        // Remove the dropdownMenu from its superview
        dropdownMenu?.removeFromSuperview()

        // Handle any other logic related to the selected item
        print("Selected item: \(item)")
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








extension HomeViewController: UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
    }

    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        // Dismiss the keyboard
        searchBar.resignFirstResponder()

        // Show the results in another controller
        let searchResultsController = ProductsViewController()
        searchResultsController.viewModel.searchText = searchBar.text ?? ""
        navigationController?.pushViewController(searchResultsController, animated: true)
    }

    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print("dsd\(searchText)")
    }
}
