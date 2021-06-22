//
//  ViewController.swift
//  UIElements
//
//  Created by DCS on 17/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Hey! Welcome"
        label.textAlignment = .center
        return label
    }()
    
    private let logIn:UILabel = {
        let label = UILabel()
        label.text = "Log In"
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        return label
    }()
    
    private let emailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Email"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    private let pwdTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Password"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    private let submitButton:UIButton = {
        let button = UIButton()
        button.setTitle("Submit", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = HomePage()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        //title = "Log In"
        view.addSubview(myLabel)
        view.addSubview(logIn)
        view.addSubview(emailTextField)
        view.addSubview(pwdTextField)
        view.addSubview(submitButton)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 160, width: view.width - 40, height: 30)
        logIn.frame = CGRect(x: 20, y: myLabel.bottom + 15, width: view.width - 40, height: 40)
        emailTextField.frame = CGRect(x: 20, y: logIn.bottom + 20, width: view.width - 40, height: 40)
        pwdTextField.frame = CGRect(x: 20, y: emailTextField.bottom + 20, width: view.width - 40, height: 40)
        submitButton.frame = CGRect(x: 100, y: pwdTextField.bottom + 30, width: view.width - 200, height: 40)
    }
    

}

