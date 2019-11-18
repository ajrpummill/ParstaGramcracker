//
//  commentCell.swift
//  ParstaGramcracker
//
//  Created by Anthony Pummill on 11/16/19.
//  Copyright © 2019 ajrpummill@gmail.com. All rights reserved.
//

import UIKit

class commentCell: UITableViewCell {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
