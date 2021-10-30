//
//  ViewController.swift
//  SampleApplication
//
//  Created by Ken Chiem on 5/18/21.
//

import UIKit

class ViewController: UIViewController {

    
    let backgroundView = UIView()
    let titleLabel = UILabel()
    let theDescription = UITextView()
    let theButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = UIColor.init(red: 206/255, green: 57/255, blue: 57/255, alpha: 1)
        
        theViews()
        theConstraints()
    }

    
    func theViews() {
        backgroundView.translatesAutoresizingMaskIntoConstraints = false
        backgroundView.backgroundColor = .white
        backgroundView.layer.cornerRadius = 25
        view.addSubview(backgroundView)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.text = "What's Good"
        titleLabel.font = UIFont.systemFont(ofSize: 48)
        view.addSubview(titleLabel)
        
        theDescription.translatesAutoresizingMaskIntoConstraints = false
        theDescription.text = "If you do not have Covid-19 - the virus that plagued the Earth all throughout 2020 - and have not done any drugs or injected any other harmful chemicals into your body, then please press the button to prove how cool and popular you are."
        theDescription.font = UIFont.systemFont(ofSize: 16)
        theDescription.textAlignment = .center
        theDescription.backgroundColor = .clear
        view.addSubview(theDescription)
        
        theButton.translatesAutoresizingMaskIntoConstraints = false
        theButton.addTarget(self, action: #selector(greenMode), for: .touchUpInside)
        theButton.backgroundColor = UIColor.init(red: 3/255, green: 148/255, blue: 252/255, alpha: 1)
        theButton.layer.cornerRadius = 25
        theButton.setTitle("Press if you're cool", for: .normal)
        view.addSubview(theButton)
    }
    
    func theConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            backgroundView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
            backgroundView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 27),
            backgroundView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -27),
        ])
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: backgroundView.topAnchor, constant: 20),
            titleLabel.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            theDescription.centerXAnchor.constraint(equalTo: backgroundView.centerXAnchor),
            theDescription.centerYAnchor.constraint(equalTo: backgroundView.centerYAnchor),
            theDescription.widthAnchor.constraint(equalToConstant: 338),
            theDescription.heightAnchor.constraint(equalToConstant: 125)
        ])
        
        NSLayoutConstraint.activate([
            theButton.bottomAnchor.constraint(equalTo: backgroundView.bottomAnchor, constant: -20),
            theButton.leadingAnchor.constraint(equalTo: backgroundView.leadingAnchor, constant: 70),
            theButton.trailingAnchor.constraint(equalTo: backgroundView.trailingAnchor, constant: -70),
            theButton.heightAnchor.constraint(equalToConstant: 46)
        ])
        
    }
    
    @objc func greenMode() {
        backgroundView.backgroundColor = UIColor.init(red: 244/255, green: 250/255, blue: 240/255, alpha: 1)
    }

}

