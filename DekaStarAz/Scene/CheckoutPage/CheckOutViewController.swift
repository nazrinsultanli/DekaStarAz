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

    private lazy var finishButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Tamamla", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 8.0
        button.addTarget(self, action: #selector(tamamlaButtonTapped), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var shertleriButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .clear
        button.setTitle("shertleri", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14)

        button.setTitleColor(.blue, for: .normal)
        //button.addTarget(self, action: #selector(didChecked), for: .touchUpInside)
        return button
    }()
    private let readAndAcceptLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = .systemFont(ofSize: 14, weight: .medium)
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "oxudum və qəbul etdim"
        return label
    }()

    @objc func didChecked() {
        if stateCheck == true {
            checkButton.setBackgroundImage(UIImage(systemName: "circle.fill"), for: .normal)
            stateCheck = false
        } else {
            checkButton.setBackgroundImage(UIImage(systemName: "circle"), for: .normal)
            stateCheck = true
        }
        
    }
    
    @objc func tamamlaButtonTapped() {
        builder?.name = fullNameTextField.text
        builder?.address = adressTextField.text
        builder?.phone = phoneNameTextField.text
        builder?.termsAgreed = stateCheck
        let controller = CheckOutSuccessPageViewController()
        navigationController?.show(controller, sender: nil)
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
        view.addSubview(finishButton)
        
        NSLayoutConstraint.activate([
            fullNameLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            fullNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            fullNameLabel.heightAnchor.constraint(equalToConstant: 50),
            fullNameLabel.widthAnchor.constraint(equalToConstant: 80),
            
            fullNameTextField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
            fullNameTextField.leadingAnchor.constraint(equalTo: fullNameLabel.trailingAnchor, constant: 20),
            fullNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            fullNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            phoneLabel.topAnchor.constraint(equalTo: fullNameLabel.bottomAnchor, constant: 10),
            phoneLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            phoneLabel.heightAnchor.constraint(equalToConstant: 50),
            phoneLabel.widthAnchor.constraint(equalToConstant: 80),
            
            phoneNameTextField.topAnchor.constraint(equalTo: fullNameTextField.bottomAnchor, constant: 10),
            phoneNameTextField.leadingAnchor.constraint(equalTo: phoneLabel.trailingAnchor, constant: 20),
            phoneNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            phoneNameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            adressLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 10),
            adressLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            adressLabel.heightAnchor.constraint(equalToConstant: 50),
            adressLabel.widthAnchor.constraint(equalToConstant: 80),
            
            adressTextField.topAnchor.constraint(equalTo: phoneNameTextField.bottomAnchor, constant: 10),
            adressTextField.leadingAnchor.constraint(equalTo: adressLabel.trailingAnchor, constant: 20),
            adressTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            adressTextField.heightAnchor.constraint(equalToConstant: 50),
            
            //MARK: terms and condition
            checkButton.topAnchor.constraint(equalTo: adressLabel.bottomAnchor, constant: 25),
            checkButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 50),
            checkButton.heightAnchor.constraint(equalToConstant: 20),
            checkButton.widthAnchor.constraint(equalToConstant: 20),
            
            
            shertleriButton.topAnchor.constraint(equalTo: adressTextField.bottomAnchor, constant: 10),
            shertleriButton.leadingAnchor.constraint(equalTo: checkButton.trailingAnchor, constant: 20),
            shertleriButton.heightAnchor.constraint(equalToConstant: 50),

            readAndAcceptLabel.centerYAnchor.constraint(equalTo: shertleriButton.centerYAnchor),
            readAndAcceptLabel.leadingAnchor.constraint(equalTo: shertleriButton.trailingAnchor, constant: 10),
            readAndAcceptLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            readAndAcceptLabel.heightAnchor.constraint(equalToConstant: 50),
            
            finishButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            finishButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
            finishButton.heightAnchor.constraint(equalToConstant: 40),
            finishButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -10),
            
            
            
            
        ])
        
    }
    
}
