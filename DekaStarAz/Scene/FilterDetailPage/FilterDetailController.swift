//
//  FilterDetailController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 06.02.24.
//

import UIKit

class FilterDetailController: UIViewController {

    var viewModel = FilterDetailViewModel()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(FilterPageTitleButtonCell.self,
                            forCellWithReuseIdentifier: FilterPageTitleButtonCell.reuseID)
        return collection
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }
    
 
    
    private func configureUI() {
        title = viewModel.filterType?.rawValue
        view.backgroundColor = .systemGray4
        
    }
    

    private func configureViewModel() {
        viewModel.getfilterItems()
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

extension FilterDetailController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //MARK: Collection view for rest Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPageTitleButtonCell.reuseID, for: indexPath) as! FilterPageTitleButtonCell
        cell.configure(item: viewModel.filterItems[indexPath.item].titleText)
        return cell
    
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width * 0.92, height: 60)
    }
    
   
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = ProductsViewController()
        controller.viewModel.specificProductSlugs.append(.init(filterType: viewModel.filterType ?? .category, filterSlug: viewModel.filterItems[indexPath.item].slugId))
//        navigationController?.show(controller, sender: nil)
    }
}
