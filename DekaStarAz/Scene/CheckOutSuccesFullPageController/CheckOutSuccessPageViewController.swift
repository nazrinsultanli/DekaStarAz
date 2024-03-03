//
//  CheckOutSuccessPageViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 29.02.24.
//

import UIKit

class CheckOutSuccessPageViewController: UIViewController {
    var viewModel = CheckOutSuccessViewModel()
    
    lazy var successMessage: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textColor = UIColor(named: "BlackWhite") // black
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 20, weight: .medium)
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ChechOutPage"
        view.backgroundColor = UIColor(named: "backgroundColor")
        configureConstraint()
    }
    override func viewWillAppear(_ animated: Bool) {
        configureViewModel()
    }
    
    private func configureViewModel() {
        viewModel.postData()
        viewModel.error = { errorMessage in
            print("Error:\(errorMessage)")
            self.successMessage.text = "Problem Bash verdi!"
        }
        viewModel.success =  {
            self.successMessage.text = "successfully Done!"
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
        view.addSubview(successMessage)
        
        NSLayoutConstraint.activate([
            successMessage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            successMessage.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            successMessage.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            successMessage.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
}
