//
//  HistoryViewController.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 26..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    // MARK: - Properties
    
    var recordStore: RecordStore!
    
    @IBOutlet var historyTableView: UITableView!
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy:MM:dd hh:mm:ss"
        return dateFormatter
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        historyTableView.rowHeight = UITableViewAutomaticDimension
        historyTableView.estimatedRowHeight = 80
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table View Data Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recordStore.allRecords.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "HistoryTableViewCell"
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? HistoryTableViewCell else {
            fatalError("The dequeued cell is not instance of HistoryTableViewCell")
        }
        
        let record = recordStore.allRecords[indexPath.row]
        
        let recordString = record.record
        let nameString = record.name
        let dateString = dateFormatter.string(from: record.dateCreated)
        
        cell.recordLabel.text = recordString
        cell.infoLabel.text = "\(nameString) \(dateString)"
        
        return cell
    }
    
    // MARK: - Actions
    
    @IBAction func closeButtonTapped(_ sender: UIButton) {
        
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            dismiss(animated: true, completion: nil)
            print("The Play View Controller is not inside a navigation controller")
        }
    }
    
    @IBAction func resetButtonTapped(_ sender: UIButton) {
        
        recordStore.removeAllRecords()
        
        historyTableView.reloadData()
    }
    
    
}
