//
//  PlayViewController.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 25..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit
import GameKit

class PlayViewController: UIViewController {
    
    // MARK: - Properties
    
    @IBOutlet var timerLabel: UILabel!
    @IBOutlet var maxRecordLabel: UILabel!
    @IBOutlet var startButton: UIButton!
    @IBOutlet var gameButton: GameButton!
    
    var recordStore: RecordStore!

    var date = Date(timeIntervalSinceReferenceDate: 0.0)
    var timer = Timer()
    
    var currentButtonNumber: Int = 1
    var isTimerRunning: Bool = false
    
    let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "mm:ss:SS"
        return dateFormatter
    }()
    
    // MARK: - View Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timerLabel.text = dateFormatter.string(from: date)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        date = Date(timeIntervalSinceReferenceDate: 0.0)
        timerLabel.text = dateFormatter.string(from: date)
        
        hideGameButtons()
        updateMaxRecordLabel()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Timer
    
    func runTimer() {
        
        date = Date(timeIntervalSinceReferenceDate: 0.0)
        
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(autoTimer),
                                     userInfo: nil,
                                     repeats: true)
        isTimerRunning = true
    }
    
    func stopTimer() {
        
        timer.invalidate()
        isTimerRunning = false
        
        guard let recordString = timerLabel.text else {
            return
        }
        
        let alertTitle = "Clear!"
        let alertMessage = "Enter your name"
        
        let alertController = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        
        alertController.addTextField(configurationHandler: { (textField) -> Void in
            textField.placeholder = "Enter your name"
        })
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
            
            if let nameString = alertController.textFields?[0].text {
                
                let newRecord = Record(name: nameString, record: recordString)
                self.recordStore.createRecord(newRecord)
                
                self.updateMaxRecordLabel()
            }
        })
        
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
        
        present(alertController, animated: true, completion: nil)

    }
    
    func autoTimer() {
        date.addTimeInterval(0.01)
        timerLabel.text = dateFormatter.string(from: date)
    }
    
    func updateTimer(for timeInterval: TimeInterval) {
        
        date.addTimeInterval(timeInterval)
        timerLabel.text = dateFormatter.string(from: date)
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        switch segue.identifier ?? "" {
        case "ShowHistoryFromPlay":
            let historyViewController = segue.destination as! HistoryViewController
            historyViewController.recordStore = self.recordStore
        default:
            fatalError("Unexpected segue identifier")
        }
    }
    
    // MARK: - Actions
    
    @IBAction func startButtonPressed(_ sender: UIButton) {
        
        if isTimerRunning == false {
            startButton.isHidden = true
            playGame()
        }
    }
    
    @IBAction func homeButtonTapped(_ sender: UIButton) {
        
        if let navigationController = navigationController {
            navigationController.popViewController(animated: true)
        } else {
            print("The Play View Controller is not inside a navigation controller")
        }
    }
    
    // MARK: - Private Methods
    
    private func updateMaxRecordLabel() {
        
        if recordStore.allRecords.count == 0 {
            maxRecordLabel.text = "- --:--:--"
        } else {
            let maxRecord = recordStore.getMaxRecord()
            
            let recordName = maxRecord.name
            let recordTime = maxRecord.record
            
            maxRecordLabel.text = "\(recordName) \(recordTime)"
        }
    }
    
    private func playGame() {
        currentButtonNumber = 1
        
        showGameButtons()
        runTimer()
    }
    
    private func hideGameButtons() {
        for index in 0...24 {
            gameButton.gameButtons[index].setTitle("", for: .disabled)
            gameButton.gameButtons[index].isHidden = true
            gameButton.gameButtons[index].alpha = 0.0
        }
    }
    
    private func showGameButtons() {
        var unshuffledArray = [Int]()
        
        for index in 1...25 {
            unshuffledArray.append(index)
        }
        
        var shuffledArray = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: unshuffledArray)
        
        for index in 0...24 {
            gameButton.gameButtons[index].alpha = 0.5
            gameButton.gameButtons[index].setTitle("\(shuffledArray[index])", for: .normal)
            gameButton.gameButtons[index].isHidden = false
            gameButton.gameButtons[index].addTarget(self,
                                                    action: #selector(self.playButtonTapped(_:)),
                                                    for: .touchUpInside)
        }
      
    }
    
    func playButtonTapped(_ sender: UIButton) {
        if let title = sender.currentTitle, let value = Int(title) {
            if value == currentButtonNumber {
                sender.setTitle("", for: .disabled)
                sender.isHidden = true
                currentButtonNumber += 1
            } else {
                updateTimer(for: 1.5)
            }
            
            if currentButtonNumber == 26 {
                startButton.isHidden = false
                hideGameButtons()
                stopTimer()
            }
        }
    }

}
