//
//  ReasonCell.swift
//  IzyCabs Driver
//
//  Created by AppOrio on 16/02/17.
//  Copyright © 2017 Apporio. All rights reserved.
//

import UIKit

class ReasonCell: UITableViewCell {
    
    @IBOutlet weak var checkRadioBtn: UIImageView!
    @IBOutlet weak var reasonText: UILabel!


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
