//
//  HomeViewController.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 26..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    // MARK: - Properties
    
    var recordStore: RecordStore!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "GoPlay":
            let playViewController = segue.destination as! PlayViewController
            playViewController.recordStore = self.recordStore
        case "ShowHistoryFromHome":
            let historyViewController = segue.destination as! HistoryViewController
            historyViewController.recordStore = self.recordStore
        default:
            fatalError("Unexpected segue identifier")
        }
    }

}
