//
//  ChangeProfileImagePage.swift
//  UIElements
//
//  Created by DCS on 21/06/21.
//  Copyright © 2021 DCS. All rights reserved.
//

import UIKit

class ChangeProfileImagePage: UIViewController {
    
    // ToolBar
    private let toolBar:UIToolbar = {
        let toolBar = UIToolbar()
        let cancel = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(handleCancel))
        let gallery = UIBarButtonItem(barButtonSystemItem: .organize, target: self, action: #selector(handleGallery))
        let camera = UIBarButtonItem(barButtonSystemItem: .camera, target: self, action: #selector(handleCamera))
        toolBar.items = [cancel,gallery, camera]
        return toolBar
    }()
    
    @objc private func handleCancel() {
        print("cancel called")
        self.dismiss(animated: true)
    }
    
    @objc private func handleGallery() {
        print("gallery called")
        imagePicker.sourceType = .photoLibrary
        DispatchQueue.main.async {
            self.present(self.imagePicker, animated: true)
        }
    }
    
    @objc private func handleCamera() {
        print("camera called")
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            imagePicker.sourceType = .camera
            DispatchQueue.main.async {
                self.present(self.imagePicker, animated: true)
            }
        } else {
            let alert = UIAlertController(title: "Oops!", message: "Camera not found. Try picking an image from your gallery.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
            DispatchQueue.main.async {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    // TabBar
    private let tabBar:UITabBar = {
        let tabBar = UITabBar()
        let history = UITabBarItem(tabBarSystemItem: .history, tag: 1)
        let downloads = UITabBarItem(tabBarSystemItem: .downloads, tag: 2)
        tabBar.items = [history, downloads]
        return tabBar
    }()
    
    // Image View
    private let myImageView:UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.image = UIImage(named: "developer.jpg")
        return imageView
    }()
    
    private let myLabel:UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Please Choose Profile Image From Gallery Or Camera."
        label.textAlignment = .left
        label.font = label.font.withSize(15)
        label.textColor = .lightGray
        return label
    }()
    
    //Save Button
    private let SaveImageButton:UIButton = {
        let button = UIButton()
        button.setTitle("Save Image", for: .normal)
        button.addTarget(self, action: #selector(handleButtonClick), for: .touchUpInside)
        button.backgroundColor = UIColor.blue
        button.layer.cornerRadius = 6
        return button
    }()
    // UIImagePickerController
    private let imagePicker:UIImagePickerController = {
        let imagePicker = UIImagePickerController()
        imagePicker.allowsEditing = false
        return imagePicker
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Profile Image"
        view.backgroundColor = .white
        
        view.addSubview(toolBar)
        view.addSubview(tabBar)
        tabBar.delegate = self
        
        view.addSubview(myImageView)
        imagePicker.delegate = self
        view.addSubview(myLabel)
        view.addSubview(SaveImageButton)
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        let toolBarHeight:CGFloat = view.safeAreaInsets.top + 35
        toolBar.frame = CGRect(x: 0, y: 20, width: view.width, height: toolBarHeight)
        
        let tabBarHeight:CGFloat = view.safeAreaInsets.bottom + 45
        tabBar.frame = CGRect(x: 0, y: view.height - tabBarHeight, width: view.width, height: tabBarHeight)
        
        myImageView.frame = CGRect(x: 20, y: toolBar.bottom + 50, width: view.width - 40, height: 200)
        myLabel.frame = CGRect(x: 20, y: myImageView.bottom + 20, width: view.width - 10, height: 40)
        SaveImageButton.frame = CGRect(x: 20, y: myLabel.bottom + 20, width: view.width - 40, height: 40)
        
    }
    
    @objc func handleButtonClick() {
        print("Clicked!")
        
        let vc = HomePage()
        navigationController?.pushViewController(vc, animated: true)
    }
    
}

extension ChangeProfileImagePage: UITabBarDelegate {
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print(item.tag)
    }
}

extension ChangeProfileImagePage:UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        if let selectedImage = info[.originalImage] as? UIImage {
            myImageView.image = selectedImage
        }
        
        picker.dismiss(animated: true)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true)
    }
}
