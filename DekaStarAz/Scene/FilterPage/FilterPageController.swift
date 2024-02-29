//
//  FilterPageController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 05.02.24.
//

import UIKit

class FilterPageController: UIViewController {
    var viewModel = FilterViewModel()
    var filterBuilder = FilterBuilder()
    var filterCompleted: ((FilterItemsStructModel) -> Void)?
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: layout)
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.register(FilterPagaCell.self,
                            forCellWithReuseIdentifier: FilterPagaCell.reuseID)
        collection.register(FilterPageTitleTextfieldCell.self,
                            forCellWithReuseIdentifier: FilterPageTitleTextfieldCell.reuseID)
        collection.register(FilterPageTitleButtonCell.self,
                            forCellWithReuseIdentifier: FilterPageTitleButtonCell.reuseID)
        
        return collection
    }()
    
    private lazy var tamamlaButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tamamla", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .green
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(tamamlaButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var temizleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Temizle", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .yellow
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(temizleButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    @objc func tamamlaButtonTapped() {
        filterCompleted?(filterBuilder.build())
        navigationController?.popViewController(animated: true)
    }
    
    @objc func temizleButtonTapped() {
        // Handle button tap action
        print("Button tapped!")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        configureConstraints()
        configureViewModel()
    }

    private func configureUI() {
        title = "Filter"
        view.backgroundColor = .white
 
    }
    
    private func configureViewModel() {
            self.collectionView.delegate = self
            self.collectionView.dataSource = self
            self.collectionView.reloadData()

    }

    private func configureConstraints() {
        view.addSubview(collectionView)
        view.addSubview(tamamlaButton)
        //view.addSubview(temizleButton)
        
        NSLayoutConstraint.activate([
            
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: tamamlaButton.topAnchor,constant: 0),
//            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            
            tamamlaButton.topAnchor.constraint(equalTo: collectionView.bottomAnchor),
            tamamlaButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
            tamamlaButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
//            tamamlaButton.bottomAnchor.constraint(equalTo: temizleButton.topAnchor,constant: -10),
            tamamlaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -10),

//            tamamlaButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
            tamamlaButton.heightAnchor.constraint(equalToConstant: 80),
            
//            temizleButton.topAnchor.constraint(equalTo: tamamlaButton.bottomAnchor, constant: 10),
//            temizleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 0),
//            temizleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: 0),
//            temizleButton.heightAnchor.constraint(equalToConstant: 80),
//            temizleButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: 0),
        
        ])
    }
}

extension FilterPageController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    //MARK: Collection view for rest Items
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.filterItems.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
     
        let itemType = viewModel.filterItems[indexPath.item]
        switch itemType {
        case .category:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPagaCell.reuseID, for: indexPath) as! FilterPagaCell
            cell.configure(item: itemType.rawValue)
            return cell
        case .collection:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPagaCell.reuseID, for: indexPath) as! FilterPagaCell
            cell.configure(item: itemType.rawValue)
            return cell
        case .brand:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPagaCell.reuseID, for: indexPath) as! FilterPagaCell
            cell.configure(item: itemType.rawValue)
            return cell
        case .inStock:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPageTitleButtonCell.reuseID, for: indexPath) as! FilterPageTitleButtonCell
            cell.configure(item: itemType.rawValue)
            cell.filterBuilder = filterBuilder
            return cell
        case .minPrice:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPageTitleTextfieldCell.reuseID, for: indexPath) as! FilterPageTitleTextfieldCell
            cell.configure(item: itemType.rawValue, itemType: itemType)
            cell.filterBuilder = filterBuilder
            return cell
        case .maxPrice:
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FilterPageTitleTextfieldCell.reuseID, for: indexPath) as! FilterPageTitleTextfieldCell
            cell.configure(item: itemType.rawValue, itemType: itemType)
            cell.filterBuilder = filterBuilder
            return cell
       
        }
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        .init(width: collectionView.frame.width * 0.92, height: 60)
    }
    
//
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt  section: Int) -> UIEdgeInsets {
//        .init(top: 0, left: 50, bottom: 0, right: 50)
//    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let controller = FilterDetailController()
        let itemType = viewModel.filterItems[indexPath.item]
        switch itemType {
        case .category:
//            controller.viewModel.filterType = itemType
//            controller.filterBuilder = filterBuilder
            controller.viewModel = .init(filterBuilder: filterBuilder, filterType: itemType)
            controller.didSelectCategory = { [weak self] categorySlugId in
                self?.filterBuilder.selectedCategory = categorySlugId
            }
            navigationController?.show(controller, sender: nil)
        case .collection:
//            controller.viewModel.filterType = itemType
//            controller.filterBuilder = filterBuilder
            controller.viewModel = .init(filterBuilder: filterBuilder, filterType: itemType)
            navigationController?.show(controller, sender: nil)
        case .brand:
//            controller.viewModel.filterType = itemType
//            controller.filterBuilder = filterBuilder
            controller.viewModel = .init(filterBuilder: filterBuilder, filterType: itemType)
            navigationController?.show(controller, sender: nil)
        default:
            break
        }
        
    }
}
