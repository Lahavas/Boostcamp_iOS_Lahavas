//
//  SignUpViewController.swift
//  SignUp
//
//  Created by Yeon on 2017. 7. 9..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController, UITextFieldDelegate, UIImagePickerControllerDelegate,
    UINavigationControllerDelegate {
    
    // MARK: Properties
    
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var checkPasswordTextField: UITextField!
    
    @IBOutlet weak var textView: UITextView!
    
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var signUpButton: UIButton!
    
    @IBOutlet weak var profileImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        idTextField.delegate = self
        passwordTextField.delegate = self
        checkPasswordTextField.delegate = self
    }
    
    // MARK: UITextFieldDelegate
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // MARK: UIImagePickerControllerDelegate
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerEditedImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but we provided the following: \(info)")
        }
        
        profileImageView.image = selectedImage
        
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: Actions
    
    @IBAction func dismissKeyboardForTextView(_ sender: UITapGestureRecognizer) {
        
        textView.resignFirstResponder()
    }
    
    @IBAction func selectImageFromPhotoLibrary(_ sender: UITapGestureRecognizer) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.allowsEditing = true
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    }
    
    @IBAction func touchUpCancelButtonToDismiss(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func touchUpSignUpButtonToDismiss(_ sender: UIButton) {
        
        if passwordTextField.text == "" {
            print("Enter password")
            return
        }
        
        if passwordTextField.text == checkPasswordTextField.text {
            dismiss(animated: true, completion: nil)
        } else {
            print("check password")
            return
        }
    }
}
