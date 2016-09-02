//
//  TableViewCell.swift
//  Present Helper
//
//  Created by Alex Owen-Meehan on 24/08/2016.
//  Copyright © 2016 Alex Owen-Meehan. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var btnShare: UIButton!
    @IBOutlet weak var txtName: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
