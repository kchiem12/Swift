//
//  ContactCardPush.swift
//  ProfileCreator
//
//  Created by Ken Chiem on 7/22/21.
//

import UIKit

//PADDING
class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 5)

    override open func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }

    override open func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
    }
}

class ContactCardPush: UIViewController {
    
    weak var delegate: UpdateInfo?
    
    let colorWell = UIColorWell()
    let accentLabel = UILabel()
    let nameLabel = UILabel()
    let nameTextField = TextField()
    let websiteLabel = UILabel()
    let websiteTextField = TextField()
    let birthdayLabel = UILabel()
    let birthdayTextField = TextField()
    let emailLabel = UILabel()
    let emailTextField = TextField()
    let phoneLabel = UILabel()
    let phoneTextField = TextField()
    
    
    //init(theName: String, theWebsite: String, theBirth: String, theEmail: String, thePhone: String) {
        
        
   //     super.init(nibName: nil, bundle: nil)
    //}
   
   // required init?(coder: NSCoder) {
    //    fatalError("init(coder:) has not been implemented")
   // }
    
    
    //to do:
    //find a way to resize colorwell
    //populate rest of view
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Edit Contact Card"
        view.backgroundColor = UIColor.init(red: 44/255, green: 47/255, blue: 53/255, alpha: 1)
        
        theViews()
        theConstraints()
        
        
    }
    
    func theViews() {
        colorWell.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(colorWell)
        
        accentLabel.translatesAutoresizingMaskIntoConstraints = false
        accentLabel.text = "ACCENT COLOR"
        accentLabel.font = UIFont.init(name: "Arial Bold", size: 12)
        accentLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(accentLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.text = "NAME"
        nameLabel.font = UIFont.init(name: "Arial Bold", size: 12)
        nameLabel.textColor = UIColor.init(red: 181/255, green: 181/255, blue: 181/255, alpha: 1)
        view.addSubview(nameLabel)
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.attributedPlaceholder = NSAttributedString(string: "Insert Name", attributes: [NSAttributedString.Key.foregroundColor : UIColor.init(red: 150/255, green: 150/255, blue: 150/255, alpha: 1)])
        nameTextField.layer.cornerRadius = 8
        nameTextField.backgroundColor = UIColor.init(red: 57/255, green: 61/255, blue: 69/255, alpha: 1)
        nameTextField.textColor = .white
        view.addSubview(nameTextField)
        
        
    }
    
    func theConstraints() {
        
        NSLayoutConstraint.activate([
            colorWell.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 130),
            colorWell.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 65)
        ])
        
        NSLayoutConstraint.activate([
            accentLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            accentLabel.bottomAnchor.constraint(equalTo: colorWell.topAnchor, constant: -6),
            accentLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            accentLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -200)
        ])
        
        NSLayoutConstraint.activate([
            nameLabel.topAnchor.constraint(equalTo: colorWell.bottomAnchor, constant: 40),
            nameLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -500),
            nameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 60),
            nameLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -200)
        ])
        
        NSLayoutConstraint.activate([
            nameTextField.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            nameTextField.heightAnchor.constraint(equalToConstant: 44),
            nameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 37),
            nameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -37)
        ])
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
}
