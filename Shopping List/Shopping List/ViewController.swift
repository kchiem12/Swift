//
//  ViewController.swift
//  Shopping List
//
//  Created by Ken Chiem on 6/25/21.
//

import UIKit

//creates the inset (offsets the text to the left a little bit)
//I think the :UITextField means that the class is an addition/inherits attributes from UITextField
class TextField: UITextField {

    let padding = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)

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


class ViewController: UIViewController {
    
    let bottomTextView = UITextView()
    let midView = UIView()
    let imageView = UIImageView()
    let titleLabel = UILabel()
    let itemNameField = TextField()
    let quantityField = TextField()
    let addButton = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        theViews()
        theConstraints()
        
    }

    
    func theViews() {
        bottomTextView.translatesAutoresizingMaskIntoConstraints = false
        bottomTextView.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        bottomTextView.layer.cornerRadius = 4
        bottomTextView.isEditable = false
        view.addSubview(bottomTextView)
        
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: "shoppingcart")
        view.addSubview(imageView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.font = UIFont.systemFont(ofSize: 24)
        titleLabel.text = "your shopping list"
        titleLabel.textColor = UIColor.init(red: 35/255, green: 40/255, blue: 107/255, alpha: 1)
        view.addSubview(titleLabel)
        
        midView.translatesAutoresizingMaskIntoConstraints = false
        midView.backgroundColor = UIColor.init(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        midView.layer.cornerRadius = 4
 
        view.addSubview(midView)
        
        itemNameField.translatesAutoresizingMaskIntoConstraints = false
        itemNameField.placeholder = "Item"
        itemNameField.backgroundColor = .white
        itemNameField.layer.cornerRadius = 4
        view.addSubview(itemNameField)
        
        quantityField.translatesAutoresizingMaskIntoConstraints = false
        quantityField.placeholder = "Quantity"
        quantityField.backgroundColor = .white
        quantityField.layer.cornerRadius = 4
        view.addSubview(quantityField)
        
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.layer.cornerRadius = 4
        addButton.backgroundColor = UIColor.init(red: 62/255, green: 138/255, blue: 248/255, alpha: 1)
        addButton.addTarget(self, action: #selector(addItem), for: .touchUpInside)
        view.addSubview(addButton)
    }
    
    func theConstraints() {
        NSLayoutConstraint.activate([
            bottomTextView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 466),
            bottomTextView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -24),
            bottomTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            bottomTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 47),
            imageView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            imageView.heightAnchor.constraint(equalToConstant: 191),
            imageView.widthAnchor.constraint(equalToConstant: 287)
        ])
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            midView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 38),
            midView.bottomAnchor.constraint(equalTo: bottomTextView.topAnchor, constant: -18),
            midView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            midView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            itemNameField.topAnchor.constraint(equalTo: midView.topAnchor, constant: 12),
            itemNameField.bottomAnchor.constraint(equalTo: midView.bottomAnchor, constant: -80),
            itemNameField.trailingAnchor.constraint(equalTo: midView.trailingAnchor, constant: -16),
            itemNameField.leadingAnchor.constraint(equalTo: midView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            quantityField.topAnchor.constraint(equalTo: itemNameField.bottomAnchor, constant: 12),
            quantityField.bottomAnchor.constraint(equalTo: midView.bottomAnchor, constant: -12),
            quantityField.trailingAnchor.constraint(equalTo: midView.trailingAnchor, constant: -82),
            quantityField.leadingAnchor.constraint(equalTo: midView.leadingAnchor, constant: 16)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: itemNameField.bottomAnchor, constant: 12),
            addButton.bottomAnchor.constraint(equalTo: midView.bottomAnchor, constant: -12),
            addButton.trailingAnchor.constraint(equalTo: midView.trailingAnchor, constant: -16),
            addButton.leadingAnchor.constraint(equalTo: quantityField.trailingAnchor, constant: 12)
        ])
 
 
    }
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    
    //add functionality for when the button is pressed
    @objc func addItem() {
        view.endEditing(true)
        
        //the guard ensures that if the textfield is empty, then when the button is pressed nothing is added
        guard let item = itemNameField.text, let quantity = quantityField.text, !item.isEmpty, !quantity.isEmpty
        else {
            return
        }
        //what happens when the textfield is not empty (has data)
        bottomTextView.text += "    -  \(item) (\(quantity))\n"
        itemNameField.text?.removeAll()
        quantityField.text?.removeAll()
    }
 

}

