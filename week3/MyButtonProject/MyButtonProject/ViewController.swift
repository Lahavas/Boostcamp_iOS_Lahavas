//
//  ViewController.swift
//  MyButtonProject
//
//  Created by Yeon on 2017. 7. 17..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet weak var myButton: MyButton!
    @IBOutlet weak var isDisableLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    // MARK: - Actions
    
    @IBAction func isDisabledChange(_ sender: UITapGestureRecognizer) {
        
        if !myButton.isDisabled {
            myButton.isDisabled = true
            myButton.titleLabel.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            isDisableLabel.text = "Enable the button"
        } else {
            myButton.isDisabled = false
            myButton.titleLabel.backgroundColor = UIColor.black
            isDisableLabel.text = "Disable the button"
        }
    }
    
}

