//
//  HomePage.swift
//  UIElements
//
//  Created by DCS on 18/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import Foundation
import UIKit

class HomePage: UIViewController {
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.text = "Welcome "
        label.textAlignment = .center
        label.font = label.font.withSize(30)
        //label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    //Image View
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 40
        imageView.image = UIImage(named: "developer.jpg")
        return imageView
    }()
    
    private let nameLabel:UILabel = {
        let label = UILabel()
        label.text = "Jack Sparrow "
        label.textAlignment = .center
        label.font = label.font.withSize(20)
        return label
    }()
    
    private let profileButton:UIButton = {
        let button = UIButton()
        button.setTitle("Edit Profile", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 6
        return button
    }()
    
    ///ProgressView
    private let progressLabel:UILabel = {
        let label = UILabel()
        label.text = "Your Progress Activity "
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        return label
    }()
    
    private let myProgressView:UIProgressView = {
        let progressView = UIProgressView()
        progressView.setProgress(0.0, animated: true)
        return progressView
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 10.0) {
            self.myProgressView.setProgress(1.0, animated: true)
        }
    }
    
    //Show Log in Time using DatePicker
    private let loginTimeLabel:UILabel = {
        let label = UILabel()
        label.text = "Your Login Date And Time"
        label.textAlignment = .left
        label.font = label.font.withSize(20)
        return label
    }()
    
    private let myDatePicker:UIDatePicker = {
        let datePicker = UIDatePicker()
        datePicker.datePickerMode = .dateAndTime
        datePicker.timeZone = TimeZone(secondsFromGMT: 0)
        return datePicker
    }()
    
    //stepper
    private let reviewStatusLabel: UILabel = {
        let stepperlabel = UILabel()
        stepperlabel.text = "Review Status"
        stepperlabel.textColor = .black
        stepperlabel.textAlignment = .center
        stepperlabel.shadowColor = .darkGray
        return stepperlabel
    }()
    
    private let stepper : UIStepper = {
        let stepper = UIStepper()
        stepper.minimumValue = 0
        stepper.maximumValue = 10
        stepper.addTarget(self, action: #selector(handleReview), for: .valueChanged)
        return stepper
    } ()
    
    @objc func handleReview()
    {
        let review = stepper.value
        ReviewResult.text = String(review)
        //activity part
        activityIndicator.isHidden = true
        activityIndicator.stopAnimating()
        nextvc.isHidden = false
    }
    
    private let nextvc : UIButton = {
        let nextvc = UIButton()
        nextvc.setTitle("Continue", for: .normal)
        nextvc.backgroundColor = .darkText
        
        nextvc.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        nextvc.isHidden = true
        nextvc.layer.cornerRadius = 20
        return nextvc
    } ()

    private let ReviewResult : UITextView = {
        let txtview = UITextView()
        txtview.isEditable = false
        txtview.font = UIFont.systemFont(ofSize: 16.0)
        txtview.backgroundColor = .blue
        txtview.textColor = .white
        txtview.textAlignment = .center
        txtview.layer.cornerRadius = 10
        return txtview
    } ()
    
    private let activityIndicator : UIActivityIndicatorView = {
        let activity = UIActivityIndicatorView()
        activity.color = .blue
        activity.startAnimating()
        return activity
    } ()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")

        view.backgroundColor = .white
        view.addSubview(myLabel)
        view.addSubview(myImageView)
        view.addSubview(nameLabel)
        view.addSubview(profileButton)
        view.addSubview(progressLabel)
        view.addSubview(myProgressView)
        view.addSubview(loginTimeLabel)
        view.addSubview(myDatePicker)
        view.addSubview(reviewStatusLabel)
        view.addSubview(ReviewResult)
        view.addSubview(stepper)
        view.addSubview(activityIndicator)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        myLabel.frame = CGRect(x: 20, y: 80, width: view.width - 40, height: 40)
        myImageView.frame = CGRect(x: 125, y: myLabel.bottom + 15, width: view.width - 250, height: 100)
        nameLabel.frame = CGRect(x: 125, y: myImageView.bottom + 15, width: view.width - 250, height: 20)
        profileButton.frame = CGRect(x: 80, y: nameLabel.bottom + 20, width: view.width - 160, height: 40)
        progressLabel.frame = CGRect(x: 20, y: profileButton.bottom + 15, width: view.width - 40, height: 40)
        myProgressView.frame = CGRect(x: 20, y: progressLabel.bottom + 20, width: view.width - 40, height: 40)
        loginTimeLabel.frame = CGRect(x: 20, y: myProgressView.bottom + 20, width: view.width - 40, height: 40)
        myDatePicker.frame = CGRect(x: 20, y: loginTimeLabel.bottom + 10, width: view.width - 40, height: 40)
        reviewStatusLabel.frame = CGRect(x: 20, y: myDatePicker.bottom + 10, width: view.width - 40, height: 40)
        ReviewResult.frame = CGRect(x: 50, y: reviewStatusLabel.bottom + 1, width: view.width - 240, height: 35)
        stepper.frame = CGRect(x: 220, y: reviewStatusLabel.bottom + 1, width: view.width - 40, height: 35)
        activityIndicator.frame = CGRect(x: 20, y: stepper.bottom + 15, width: view.width - 40, height: 50)
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = EditProfilePage()
        
        navigationController?.pushViewController(vc, animated: true)
    }
    
}
