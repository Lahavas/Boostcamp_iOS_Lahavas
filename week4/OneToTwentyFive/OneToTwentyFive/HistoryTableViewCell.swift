//
//  HistoryTableViewCell.swift
//  OneToTwentyFive
//
//  Created by Yeon on 2017. 7. 26..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class HistoryTableViewCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet var recordLabel: UILabel!
    @IBOutlet var infoLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        recordLabel.adjustsFontForContentSizeCategory = true
        infoLabel.adjustsFontForContentSizeCategory = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
