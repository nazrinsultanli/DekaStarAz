//
//  HomeViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class HomeViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        
        collection.register(HomeCollectionCell.self, forCellWithReuseIdentifier: HomeCollectionCell.reuseID)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func searchButton() {
        let cv = CategoryViewController()
        navigationController?.show(cv, sender: nil)
    }
    
    private func configureUI() {
        navigationItem.title = "DEKASTAR COMPANY"
       // navigationBar.topItem.title = "DEKASTAR COMPANY"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action:  #selector(searchButton)
        )
    }
    func setUpConstraints() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 8),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0)])
    }
}


extension HomeViewController:UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       // viewModel.items.count
        5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: HomeCollectionCell.reuseID, for: indexPath) as! HomeCollectionCell
//        let item = viewModel.items[indexPath.row]
//        cell.delegate = self
//        cell.configure(title: item.title, movies: item.result, endpoint: item.endPoint)
        return cell
    }
    

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width, height: 296)
    }
    

}

//
//extension HomeViewController: HomePageCollectionViewCellDelegate {
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
//}
//
