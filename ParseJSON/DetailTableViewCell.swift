//
//  DetailTableViewCell.swift
//  ParseJSON
//
//  Created by Sai Pratap Koppolu on 19/04/18.
//  Copyright © 2018 Sai Pratap Koppolu. All rights reserved.
//

import UIKit

class DetailTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var idNo: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var address: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static func registerNib() -> UINib {
        return UINib(nibName: "DetailTableViewCell", bundle: nil)
    }
    
    static func reusableIdentifier() -> String {
        return "DetailTableViewCell"
    }

}
