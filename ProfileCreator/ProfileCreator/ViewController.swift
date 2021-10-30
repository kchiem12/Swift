//
//  ViewController.swift
//  ProfileCreator
//
//  Created by Ken Chiem on 7/21/21.
//

import UIKit

//create protocals and delegates later on

protocol UpdateInfo: AnyObject {
    func updateStuff(newColor: UIColor, newName: String, newURL: String,
                     newDate: String, newEmail: String, newPhone: String)
}

//try using this extension later
extension UIView {

  // OUTPUT 1
  func dropShadow(scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = UIColor.black.cgColor
    layer.shadowOpacity = 0.5
    layer.shadowOffset = CGSize(width: -1, height: 1)
    layer.shadowRadius = 1

    layer.shadowPath = UIBezierPath(rect: bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }

  // OUTPUT 2
  func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
    layer.masksToBounds = false
    layer.shadowColor = color.cgColor
    layer.shadowOpacity = opacity
    layer.shadowOffset = offSet
    layer.shadowRadius = radius

    layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
    layer.shouldRasterize = true
    layer.rasterizationScale = scale ? UIScreen.main.scale : 1
  }
}

class ViewController: UIViewController {
    

    let middleView = UIView()
    let profileView = UIView()
    let imageView = UIImageView()
    let nameLabel = UILabel()
    let urlLabel = UILabel()
    let birthdayLabel = UILabel()
    let birthdayDateLabel = UILabel()
    let emailLabel = UILabel()
    let emailNameLabel = UILabel()
    let phoneLabel = UILabel()
    let phoneNumberLabel = UILabel()
    let contactCardButton = UIButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        title = "My Contact Card"
        
        
        view.backgroundColor = UIColor.init(red: 44/255, green: 47/255, blue: 53/255, alpha: 1)


        navigationController?.navigationBar.barTintColor = UIColor.init(red: 57/255, green: 61/255, blue: 69/255, alpha: 1)
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        
        
        //to create a shadow layer on the middle view
        middleView.layer.masksToBounds = false
        middleView.layer.shadowColor = UIColor.black.cgColor
        middleView.layer.shadowOffset = CGSize(width: 0, height: 10)
        middleView.layer.shadowRadius = 10
        middleView.layer.shadowOpacity = 0.6
        
        theViews()
        theConstraints()
        
    }
    
    func theViews() {
        middleView.translatesAutoresizingMaskIntoConstraints = false
        middleView.backgroundColor = UIColor.init(red: 57/255, green: 61/255, blue: 69/255, alpha: 1)
        middleView.layer.cornerRadius = 8
        view.addSubview(middleView)
        
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .green
        profileView.layer.cornerRadius = 8
        view.addSubview(profileView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "Woman1")
        imageView.layer.cornerRadius = 8
        view.addSubview(imageView)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "[Insert Name]"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        view.addSubview(nameLabel)
        nameLabel.font = UIFont.init(name: "Arial", size: 24.0)
        
        urlLabel.translatesAutoresizingMaskIntoConstraints = false
        urlLabel.text = "[Insert URL]"
        urlLabel.font = UIFont.init(name: "Arial", size: 12.0)
        urlLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        urlLabel.textAlignment = .center
        view.addSubview(urlLabel)
        
        birthdayLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayLabel.text = "BIRTHDAY"
        birthdayLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        birthdayLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(birthdayLabel)
        
        birthdayDateLabel.translatesAutoresizingMaskIntoConstraints = false
        birthdayDateLabel.text = "[Insert Date]"
        birthdayDateLabel.font = UIFont.init(name: "Arial", size: 12.0)
        birthdayDateLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(birthdayDateLabel)
        
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        emailLabel.text = "EMAIL"
        emailLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        emailLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(emailLabel)
        
        emailNameLabel.translatesAutoresizingMaskIntoConstraints = false
        emailNameLabel.text = "[Insert Email]"
        emailNameLabel.font = UIFont.init(name: "Arial", size: 12.0)
        emailNameLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(emailNameLabel)
        
        phoneLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneLabel.text = "PHONE"
        phoneLabel.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        phoneLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(phoneLabel)
        
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        phoneNumberLabel.text = "[Insert Phone Number]"
        phoneNumberLabel.font = UIFont.init(name: "Arial", size: 12.0)
        phoneNumberLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(phoneNumberLabel)
        
        contactCardButton.translatesAutoresizingMaskIntoConstraints = false
        contactCardButton.backgroundColor = .clear
        contactCardButton.setTitle("EDIT CONTACT CARD >", for: .normal)
        contactCardButton.setTitleColor(UIColor.init(red: 121/255, green: 175/255, blue: 255/255, alpha: 1), for: .normal)
        contactCardButton.titleLabel?.font = UIFont(name: "Arial Bold", size: 12)
        contactCardButton.titleLabel?.textAlignment = .right
        contactCardButton.addTarget(self, action: #selector(pushContactCardView), for: .touchUpInside)
        view.addSubview(contactCardButton)
        
        
    }
    
    func theConstraints() {
        NSLayoutConstraint.activate([
            middleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            middleView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200),
            middleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 12),
            middleView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            profileView.heightAnchor.constraint(equalToConstant: 151),
            profileView.widthAnchor.constraint(equalToConstant: 151),
            profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 75),
            profileView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            imageView.heightAnchor.constraint(equalToConstant: 141),
            imageView.widthAnchor.constraint(equalToConstant: 141),
            imageView.centerYAnchor.constraint(equalTo: profileView.centerYAnchor),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: profileView.bottomAnchor, constant: 15),
            nameLabel.heightAnchor.constraint(equalToConstant: 48),
            nameLabel.widthAnchor.constraint(equalToConstant: 268),
            nameLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        
        
        NSLayoutConstraint.activate([
            urlLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 1),
            urlLabel.heightAnchor.constraint(equalToConstant: 14),
            urlLabel.widthAnchor.constraint(equalToConstant: 200),
            urlLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            birthdayLabel.topAnchor.constraint(equalTo: urlLabel.bottomAnchor, constant: 15),
            birthdayLabel.heightAnchor.constraint(equalToConstant: 12),
            birthdayLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 25),
            birthdayLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -250)
        ])
        
        NSLayoutConstraint.activate([
            birthdayDateLabel.topAnchor.constraint(equalTo: birthdayLabel.bottomAnchor, constant: 8),
            birthdayDateLabel.heightAnchor.constraint(equalToConstant: 12),
            birthdayDateLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 25),
            birthdayDateLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: birthdayDateLabel.bottomAnchor, constant: 15),
            emailLabel.heightAnchor.constraint(equalToConstant: 12),
            emailLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 25),
            emailLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -250)
        ])
        
        NSLayoutConstraint.activate([
            emailNameLabel.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailNameLabel.heightAnchor.constraint(equalToConstant: 12),
            emailNameLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 25),
            emailNameLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            phoneLabel.topAnchor.constraint(equalTo: emailNameLabel.bottomAnchor, constant: 15),
            phoneLabel.heightAnchor.constraint(equalToConstant: 12),
            phoneLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 25),
            phoneLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -250)
        ])
        
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: phoneLabel.bottomAnchor, constant: 8),
            phoneNumberLabel.heightAnchor.constraint(equalToConstant: 12),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 25),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -25)
        ])
        
        NSLayoutConstraint.activate([
            contactCardButton.bottomAnchor.constraint(equalTo: middleView.bottomAnchor, constant: -10),
            contactCardButton.heightAnchor.constraint(equalToConstant: 12),
            contactCardButton.leadingAnchor.constraint(equalTo: middleView.leadingAnchor, constant: 200),
            contactCardButton.trailingAnchor.constraint(equalTo: middleView.trailingAnchor, constant: -20)
        ])
 
 
    }
    
    @objc func pushContactCardView() {
        let contactCardView = ContactCardPush()
        navigationController?.pushViewController(contactCardView, animated: true)
    }


}

//make up function
/*
extension ViewController: UpdateInfo {
    
}
 */

