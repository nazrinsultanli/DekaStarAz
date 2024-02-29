//
//  CheckOutSuccessPageViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import UIKit

class CheckOutSuccessPageViewController: UIViewController {

    var viewModel = CheckOutViewModel()
    
    lazy var totalPriceLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = .black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 18, weight: .medium)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "page"
        view.backgroundColor = .white
        configureConstraint()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel.postData()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
        }
        viewModel.success =  {
            self.totalPriceLabel.text = "successfully Done!"
            self.dismissBackPage()
        }
    }
    func dismissBackPage() {
        self.navigationItem.leftBarButtonItem = nil;
        self.navigationItem.hidesBackButton = true;
        self.navigationController?.navigationItem.backBarButtonItem?.isEnabled = false;
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = false;
    }
    
    func configureConstraint() {
       
        view.addSubview(totalPriceLabel)

        NSLayoutConstraint.activate([
            totalPriceLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            totalPriceLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            totalPriceLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            totalPriceLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
          
            
        ])
    }

}
