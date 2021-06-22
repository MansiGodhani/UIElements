//
//  EditProfilePage.swift
//  UIElements
//
//  Created by DCS on 20/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//


import UIKit

class EditProfilePage: UIViewController {
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Hey! Welcome Jack"
        label.textAlignment = .center
        //label.font = label.font.withSize(30)
        //label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "developer.jpg")
        return imageView
    }()
    
    private let profileButton:UIButton = {
        let button = UIButton()
        button.setTitle("Change Profile Image", for: .normal)
        button.addTarget(self, action: #selector(changeProfileImage), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    //User Name
    private let UserNameLabel:UILabel = {
        let label = UILabel()
        label.text = "User Name"
        label.textAlignment = .left
        //label.font = label.font.withSize(20)
        //label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private let UserNameTextView:UITextView = {
        let textView = UITextView()
        textView.text = "Jack_Sparrow007"
        textView.textAlignment = .center
        textView.font = textView.font?.withSize(16)
        textView.backgroundColor = .lightGray
        return textView
    }()
    
    //Bio
    private let BioLabel:UILabel = {
        let label = UILabel()
        label.text = "Bio"
        label.textAlignment = .left
        return label
    }()
    
    private let BioTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Bio"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        textField.backgroundColor = .lightGray
        return textField
    }()
    
    //Switch Account
    private let SwitchAccountLabel:UILabel = {
        let label = UILabel()
        label.text = "Switch To Professional Account"
        label.textAlignment = .left
        label.font = label.font.withSize(23)
        return label
    }()
    
    private let mySwitch:UISwitch = {
        let switcher = UISwitch()
        switcher.addTarget(self, action: #selector(handleSwitch), for: .valueChanged)
        return switcher
    }()
    
    private let personalInfoSettingButton:UIButton = {
        let button = UIButton()
        button.setTitle("Personal Information Setting", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
        view.backgroundColor = .white
        
        view.addSubview(myLabel)
        view.addSubview(myImageView)
        view.addSubview(profileButton)
        view.addSubview(UserNameLabel)
        view.addSubview(UserNameTextView)
        view.addSubview(BioLabel)
        view.addSubview(BioTextField)
        view.addSubview(SwitchAccountLabel)
        view.addSubview(mySwitch)
        view.addSubview(personalInfoSettingButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 30)
        myImageView.frame = CGRect(x: 60, y: myLabel.bottom + 20, width: view.width - 120, height: 80)
        profileButton.frame = CGRect(x: 60, y: myImageView.bottom + 20, width: view.width - 120, height: 40)
        UserNameLabel.frame = CGRect(x: 20, y: profileButton.bottom + 18, width: view.width - 40, height: 40)
        UserNameTextView.frame = CGRect(x: 120, y: UserNameLabel.bottom - 35, width: view.width - 150, height: 35)
        BioLabel.frame = CGRect(x: 20, y: UserNameTextView.bottom + 20, width: view.width - 40, height: 40)
        BioTextField.frame = CGRect(x: 60, y: BioLabel.bottom - 30, width: view.width - 90, height: 34)
        SwitchAccountLabel.frame = CGRect(x: 20, y: BioTextField.bottom + 20, width: view.width - 40, height: 40)
        mySwitch.frame = CGRect(x: 20, y: SwitchAccountLabel.bottom + 20, width: view.width - 40, height: 40)
        personalInfoSettingButton.frame = CGRect(x: 20, y: mySwitch.bottom + 30, width: view.width - 40, height: 40)    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
    
    let vc = PersonalInfoSettingPage()
    
    navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc private func changeProfileImage() {
        let imagevc = ChangeProfileImagePage()
        let nav = UINavigationController(rootViewController: imagevc)
        nav.modalPresentationStyle = .fullScreen
        nav.setNavigationBarHidden(true, animated: false)
        present(nav, animated: false)
    }
    
    @objc func handleSwitch() {
        print(mySwitch.isOn)
    }
}

    


