//
//  ItemCell.swift
//  Homepwner
//
//  Created by Yeon on 2017. 7. 17..
//  Copyright © 2017년 Yeon. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {
    
    // MARK: - Properties
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var serialNumberLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
