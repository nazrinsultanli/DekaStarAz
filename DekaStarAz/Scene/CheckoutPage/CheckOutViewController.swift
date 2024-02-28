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
    var stateCheck = true
    
    private let fullNameLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Ad Soyad:"
        return label
    }()
    private let fullNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Ad Soyadinizi daxil edin"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        return textField
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Nomre:"
        return label
    }()
    private let phoneNameTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Nomrenizi daxil edin"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        return textField
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Adress:"
        return label
    }()
    private let adressTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "Adressi daxil edin"
        textField.font = UIFont.systemFont(ofSize: 14)
        textField.borderStyle = .roundedRect
        textField.textAlignment = .left
        return textField
    }()
    
    
    private lazy var checkButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(didChecked), for: .touchUpInside)
        
        button.contentMode = .scaleAspectFit
        return button
    }()

    private lazy var shertleriButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("şərtləri", for: .normal)
        button.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
        button.addTarget(self, action: #selector(didChecked), for: .touchUpInside)
        button.contentMode = .scaleAspectFit
        return button
    }()
    private let readAndAcceptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "şərtləri oxudum və qəbul etdim"
        return label
    }()

    @objc func didChecked() {
        if stateCheck == true {
            checkButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            stateCheck = false
        } else {
            checkButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            stateCheck = false
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "CheckOut"
        view.backgroundColor = .white
        configureConstraint()
        configureViewModel()
        
    }
    
    func configureViewModel() {
        
    }
    func configureConstraint() {
        view.addSubview(fullNameLabel)
        view.addSubview(fullNameTextField)
        view.addSubview(phoneLabel)
        view.addSubview(phoneNameTextField)
        view.addSubview(adressLabel)
        view.addSubview(adressTextField)
        view.addSubview(checkButton)
        view.addSubview(shertleriButton)
        view.addSubview(readAndAcceptLabel)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            fullNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            fullNameTextField.leadingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: 20),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            phoneLabel.heightAnchor.constraint(equalToConstant: 50),
            phoneLabel.widthAnchor.constraint(equalToConstant: 80),
            
            phoneNameTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 10),
            phoneNameTextField.leadingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 20),
            phoneNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            phoneNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            adressLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            adressLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            adressLabel.heightAnchor.constraint(equalToConstant: 50),
            adressLabel.widthAnchor.constraint(equalToConstant: 80),
            
            adressTextField.topAnchor.constraint(equalTo: phoneNameTextField.bottomAnchor, constant: 10),
            adressTextField.leadingAnchor.constraint(equalTo: adressLabel.trailingAnchor, constant: 20),
            adressTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            adressTextField.heightAnchor.constraint(equalToConstant: 50),
            
            checkButton.topAnchor.constraint(equalTo: adressTextField.bottomAnchor, constant: 100),
            checkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
            checkButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            checkButton.heightAnchor.constraint(equalToConstant: 50),
            
            
            
            
        ])
        
    }
    
}
