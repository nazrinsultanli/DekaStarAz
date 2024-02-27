//
//  CheckOutViewController.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 27.02.24.
//

import UIKit

class CheckOutViewController: UIViewController {
    var builder: CheckoutBuilder?
    var totalCheckOutPrice: Double = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CheckOut"
        view.backgroundColor = .white
//        configureConstraint()
        configureViewModel()
        
    }
    
    func configureViewModel() {
       
    }
    

}
