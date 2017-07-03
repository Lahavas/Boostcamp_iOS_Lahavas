//
//  ViewController.swift
//  Login
//
//  Created by Yeon on 2017. 7. 3..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Properties
    @IBOutlet weak var idTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    // MARK: Actions
    @IBAction func clickSignIn(_ sender: UIButton) {
        print("touch up inside - sign in")
        
        if let id = idTextField.text, let password = passwordTextField.text {
            print("ID : " + id + ", PW : " + password)
        } else {
            print("Error")
        }
    }

    @IBAction func clickSignUp(_ sender: UIButton) {
        print("touch up inside - sign up")
    }
}

