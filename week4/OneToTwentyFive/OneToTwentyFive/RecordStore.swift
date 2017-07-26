//
//  RecordStore.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 26..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class RecordStore {
    
    // MARK: - Properties
    
    var allRecords = [Record]()
    
    let recordArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        
        return documentDirectory.appendingPathComponent("records.archive") as URL
    }()
    
    // MARK: - Initialization
    
    init() {
        
        if let archivedRecords = NSKeyedUnarchiver.unarchiveObject(withFile: recordArchiveURL.path) as? [Record] {
            allRecords = archivedRecords
        }
    }
    
    // MARK: - ItemStore Management
    
    func createRecord(_ newRecord: Record) {
        
        allRecords.append(newRecord)
        
        allRecords.sort { $0.record < $1.record }
    }
    
    func removeAllRecords() {
        
        allRecords.removeAll()
    }
    
    func getMaxRecord() -> Record {
        return allRecords[0]
    }
    
    func saveChanges() -> Bool {
        print("Saving items to: \(recordArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allRecords, toFile: recordArchiveURL.path)
    }
}
