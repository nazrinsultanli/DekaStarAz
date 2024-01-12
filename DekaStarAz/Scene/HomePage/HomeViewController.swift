//
//  HomeViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 12.01.24.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func searchButton() {
        let cv = CategoryViewController()
        navigationController?.show(cv, sender: nil)
    }
    
    private func configureUI() {
        title = "DEKASTAR COMPANY"
        view.backgroundColor = .white
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "magnifyingglass"),
            style: .done,
            target: self,
            action:  #selector(searchButton)
        )
    }
}
