//
//  Record.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 26..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class Record: NSObject, NSCoding {
    
    // MARK: - Properties
    
    var name: String
    var record: String
    var dateCreated: Date
    
    // MARK: - Initialization
    
    init(name: String, record: String) {
        
        self.name = name
        self.record = record
        self.dateCreated = Date()
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObject(forKey: "name") as! String
        record = aDecoder.decodeObject(forKey: "record") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        
        super.init()
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(record, forKey: "record")
        aCoder.encode(dateCreated, forKey: "dateCreated")
    }
}
