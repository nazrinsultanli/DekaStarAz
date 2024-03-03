//
//  ContactDataCell.swift
//  DekaStarAz
//
//  Created by Nazrin Sultanlı on 25.02.24.
//

import UIKit

class ContactDataCell: UITableViewCell {
    static let reuseID = "ContactDataCell"

    lazy var adressImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "mappin.and.ellipse")
        return imageView
    }()
    
    lazy var phoneImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "phone.circle")
        return imageView
    }()
    
    lazy var hoursImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "clock.badge.checkmark")
        return imageView
    }()
    
    lazy var emailImage: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "envelope")
        return imageView
    }()


    private let adressText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Adress"
        label.numberOfLines = 0
        return label
    }()
    
    private let adressLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
   
    private let phoneText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Bize Zeng Edin"
        label.numberOfLines = 0
        return label
    }()
    
    private let phoneLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let hoursText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "Ish saatlari"
        label.numberOfLines = 0
        return label
    }()
    
    private let hoursLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    private let emailText: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.text = "E-mail"
        label.numberOfLines = 0
        return label
    }()
    
    private let emailLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupUI()
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupUI() {
        contentView.addSubview(adressImage)
        contentView.addSubview(phoneImage)
        contentView.addSubview(hoursImage)
        contentView.addSubview(emailImage)
        contentView.addSubview(adressText)
        contentView.addSubview(adressLabel)
        contentView.addSubview(phoneText)
        contentView.addSubview(phoneLabel)
        contentView.addSubview(hoursText)
        contentView.addSubview(hoursLabel)
        contentView.addSubview(emailText)
        contentView.addSubview(emailLabel)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            // MARK: adress
            adressImage.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            adressImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            adressImage.heightAnchor.constraint(equalToConstant: 60),
            adressImage.widthAnchor.constraint(equalToConstant: 60),
            
            adressText.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            adressText.leadingAnchor.constraint(equalTo: adressImage.trailingAnchor, constant: 10),
            adressText.heightAnchor.constraint(equalToConstant: 20),
            
            adressLabel.topAnchor.constraint(equalTo: adressText.bottomAnchor),
            adressLabel.leadingAnchor.constraint(equalTo: adressImage.trailingAnchor, constant: 10),
            adressLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // MARK: phone
            phoneImage.topAnchor.constraint(equalTo: adressImage.bottomAnchor, constant: 20),
            phoneImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneImage.heightAnchor.constraint(equalToConstant: 60),
            phoneImage.widthAnchor.constraint(equalToConstant: 60),
            
            phoneText.topAnchor.constraint(equalTo: adressImage.bottomAnchor, constant: 20),
            phoneText.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 10),
            phoneText.heightAnchor.constraint(equalToConstant: 20),
            
            phoneLabel.topAnchor.constraint(equalTo: phoneText.bottomAnchor),
            phoneLabel.leadingAnchor.constraint(equalTo: phoneImage.trailingAnchor, constant: 10),
            phoneLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // MARK: hours
            hoursImage.topAnchor.constraint(equalTo: phoneImage.bottomAnchor, constant: 20),
            hoursImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            hoursImage.heightAnchor.constraint(equalToConstant: 60),
            hoursImage.widthAnchor.constraint(equalToConstant: 60),
            
            hoursText.topAnchor.constraint(equalTo: phoneImage.bottomAnchor, constant: 20),
            hoursText.leadingAnchor.constraint(equalTo: hoursImage.trailingAnchor, constant: 10),
            hoursText.heightAnchor.constraint(equalToConstant: 20),
            
            hoursLabel.topAnchor.constraint(equalTo: hoursText.bottomAnchor),
            hoursLabel.leadingAnchor.constraint(equalTo: hoursImage.trailingAnchor, constant: 10),
            hoursLabel.heightAnchor.constraint(equalToConstant: 40),
            
            // MARK: email
            emailImage.topAnchor.constraint(equalTo: hoursImage.bottomAnchor, constant: 20),
            emailImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            emailImage.heightAnchor.constraint(equalToConstant: 60),
            emailImage.widthAnchor.constraint(equalToConstant: 60),
            
            emailText.topAnchor.constraint(equalTo: hoursImage.bottomAnchor, constant: 20),
            emailText.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 10),
            emailText.heightAnchor.constraint(equalToConstant: 20),
            
            emailLabel.topAnchor.constraint(equalTo: emailText.bottomAnchor),
            emailLabel.leadingAnchor.constraint(equalTo: emailImage.trailingAnchor, constant: 10),
            emailLabel.heightAnchor.constraint(equalToConstant: 40),
        ])
    }
    
    func configure(item: SettingsPageItemsProtocols) {
        adressLabel.text = item.adresss
        phoneLabel.text = item.phone[0].phone
        hoursLabel.text = item.workingHour
        emailLabel.text = item.email[0].email
    }
}
