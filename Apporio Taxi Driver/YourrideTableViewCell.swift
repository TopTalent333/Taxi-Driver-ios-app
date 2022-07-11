//
//  YourrideTableViewCell.swift
//  TaxiApp Driver
//
//  Created by AppOrio on 07/02/17.
//  Copyright © 2017 Apporio. All rights reserved.
//

import UIKit

class YourrideTableViewCell: UITableViewCell {
    
    @IBOutlet weak var mainview: UIView!
    
    @IBOutlet weak var datetimelabel: UILabel!
    
    @IBOutlet weak var pickuplabel: UILabel!
    
    @IBOutlet weak var usernamelabel: UILabel!
    
    @IBOutlet weak var usermobilelabel: UILabel!
    
    @IBOutlet weak var statuslabel: UILabel!
   
    @IBOutlet weak var dropuplabel: UILabel!
    
   @IBOutlet weak var renteltypelabel: UILabel!
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
