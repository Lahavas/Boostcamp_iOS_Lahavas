//
//  Item.swift
//  Homepwner
//
//  Created by Yeon on 2017. 7. 17..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class Item: NSObject, NSCoding {
    
    // MARK: - Properties
    
    var name: String
    var valueInDollars: Int
    var serialNumber: String?
    let dateCreated: Date
    let itemKey: String
    
    // MARK: - Initialization
    
    init(name: String, valueInDollars: Int, serialNumber: String?) {
       
        self.name = name
        self.valueInDollars = valueInDollars
        self.serialNumber = serialNumber
        self.dateCreated = Date()
        self.itemKey = UUID().uuidString
    }
    
    required init(coder aDecoder: NSCoder) {
        
        name = aDecoder.decodeObject(forKey: "name") as! String
        dateCreated = aDecoder.decodeObject(forKey: "dateCreated") as! Date
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        serialNumber = aDecoder.decodeObject(forKey: "serialNumber") as! String?
        
        valueInDollars = aDecoder.decodeInteger(forKey: "valueInDollars")
        
        super.init()
    }
    
    convenience init(random: Bool = false) {
        
        if random {
            let adjectives = ["Fluffy", "Rusty", "Shiny"]
            let nouns = ["Bear", "Spork", "Mac"]
            
            var index = arc4random_uniform(UInt32(adjectives.count))
            let randomAdjective = adjectives[Int(index)]
            
            index = arc4random_uniform(UInt32(nouns.count))
            let randomNoun = nouns[Int(index)]
            
            let randomName = "\(randomAdjective) \(randomNoun)"
            let randomValue = Int(arc4random_uniform(100))
            let randomSerialNumber = UUID().uuidString.components(separatedBy: "-").first!
            
            self.init(name: randomName,
                      valueInDollars: randomValue,
                      serialNumber: randomSerialNumber)
        } else {
            self.init(name: "", valueInDollars: 0, serialNumber: nil)
        }
    }
    
    // MARK: - NSCoding
    
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(name, forKey: "name")
        aCoder.encode(dateCreated, forKey: "dateCreated")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(serialNumber, forKey: "serialNumber")
        
        aCoder.encode(valueInDollars, forKey: "valueInDollars")
    }
}
