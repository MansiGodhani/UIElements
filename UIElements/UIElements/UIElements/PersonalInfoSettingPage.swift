//
//  PersonalInfoSettingPage.swift
//  UIElements
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class PersonalInfoSettingPage: UIViewController {
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0;
        label.text = "Provide Your Pesonal Information. This won't \n be part of your public profile."
        label.textAlignment = .left
        label.font = label.font.withSize(15)
        label.textColor = .lightGray
        return label
    }()
    
    //Email
    private let EmailLabel:UILabel = {
        let label = UILabel()
        label.text = "Email"
        label.textAlignment = .left
        return label
    }()
    
    private let EmailTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Email"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //PhoneNo
    private let PhoneNoLabel:UILabel = {
        let label = UILabel()
        label.text = "PhoneNo"
        label.textAlignment = .left
        return label
    }()
    
    private let PhoneNoTextField:UITextField = {
        let textField = UITextField()
        textField.placeholder = "Enter Your Phone No"
        textField.textAlignment = .left
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    //Gender
    private let GenderLabel:UILabel = {
        let label = UILabel()
        label.text = "Gender"
        label.textAlignment = .left
        return label
    }()

    private let GenderSegmentedControl:UISegmentedControl = {
        let segControl = UISegmentedControl()
        segControl.insertSegment(withTitle: "Male", at: 0, animated: true)
        segControl.insertSegment(withTitle: "Female", at: 1, animated: true)
        segControl.selectedSegmentIndex = 0
        segControl.addTarget(self, action: #selector(handleSegmentedControl), for: .valueChanged)
        return segControl
    }()
    
    //Date Of Birth
    private let DateOfBirthLabel:UILabel = {
        let label = UILabel()
        label.text = "Birth Date"
        label.textAlignment = .left
        return label
    }()
    
    private let BirthDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .date
        datePicker.addTarget(self, action: #selector(handleDateChange), for: .valueChanged)
        return datePicker
    }()
    
    //Save Button
    private let SaveButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save", for: .normal)
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
        view.addSubview(EmailLabel)
        view.addSubview(EmailTextField)
        view.addSubview(PhoneNoLabel)
        view.addSubview(PhoneNoTextField)
        view.addSubview(GenderLabel)
        view.addSubview(GenderSegmentedControl)
        view.addSubview(DateOfBirthLabel)
        view.addSubview(BirthDatePicker)
        view.addSubview(SaveButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 25, y: 80, width: view.width - 10, height: 50)
        EmailLabel.frame = CGRect(x: 20, y: myLabel.bottom + 15, width: view.width - 40, height: 20)
        EmailTextField.frame = CGRect(x: 20, y: EmailLabel.bottom + 20, width: view.width - 40, height: 30)
        PhoneNoLabel.frame = CGRect(x: 20, y: EmailTextField.bottom + 15, width: view.width - 40, height: 20)
        PhoneNoTextField.frame = CGRect(x: 20, y: PhoneNoLabel.bottom + 20, width: view.width - 40, height: 30)
        GenderLabel.frame = CGRect(x: 20, y: PhoneNoTextField.bottom + 15, width: view.width - 40, height: 30)
        GenderSegmentedControl.frame = CGRect(x: 20, y: GenderLabel.bottom + 15, width: view.width - 40, height: 30)
        DateOfBirthLabel.frame = CGRect(x: 20, y: GenderSegmentedControl.bottom + 15, width: view.width - 40, height: 30)
        BirthDatePicker.frame = CGRect(x: 20, y: DateOfBirthLabel.bottom + 15, width: view.width - 40, height: 40)
        SaveButton.frame = CGRect(x: 20, y: BirthDatePicker.bottom + 20, width: view.width - 40, height: 40)
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
    
        let vc = HomePage()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func handleSegmentedControl() {
        print(GenderSegmentedControl.selectedSegmentIndex)
    }
    
    @objc func handleDateChange() {
        print(BirthDatePicker.date)
    }
}
