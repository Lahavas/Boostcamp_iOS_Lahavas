//
//  LogInViewController.swift
//  SignUp
//
//  Created by Yeon on 2017. 7. 9..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class LogInViewController: UIViewController {

    //MARK: Properties

    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    //MARK: Methods
    
    @IBAction func touchUpSignInButton(_ sender: UIButton) {
        print("touch up inside - sign in")
        print("ID : \(idTextField.text ?? ""), PW : \(passwordTextField.text ?? "")")
    }
    
    @IBAction func touchUpSignUpButton(_ sender: UIButton) {
        print("touch up inside - sign up")
    }
}
