//
//  ViewController.swift
//  WhatFlower
//
//  Created by Serhii Onyshchenko on 02.08.2020.
//  Copyright © 2020 Serhii Onyshchenko. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var imageView: UIImageView!
    
    let imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imagePicker.delegate = self
//        imagePicker.sourceType = .camera
        imagePicker.sourceType = .photoLibrary
//        imagePicker.allowsEditing = false
        imagePicker.allowsEditing = true
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
//        let userPickedImage = info[UIImagePickerController.InfoKey.originalImage]
        let userPickedImage = info[UIImagePickerController.InfoKey.editedImage]
        imageView.image = userPickedImage as? UIImage
        
        imagePicker.dismiss(animated: true, completion: nil)
    }

    @IBAction func cameraTapped(_ sender: UIBarButtonItem) {
        present(imagePicker, animated: true, completion: nil)
    }
    
}

