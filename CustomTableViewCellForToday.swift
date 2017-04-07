//
//  CustomTableViewCellForToday.swift
//  SpiritFitnessApp_Team4_SwiftProject
//
//  Created by Sumirna Philips on 4/3/17.
//  Copyright © 2017 19483. All rights reserved.
//

import UIKit

class CustomTableViewCellForToday: UITableViewCell {
    @IBOutlet var workOutLabel: UILabel!
    @IBOutlet var stepsCountLabel: UILabel!
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
