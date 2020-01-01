//
//  DropdownlistWithTitleCell.swift
//  ProtocolBasedSections
//
//  Created by rakesh karapu on 01/01/20.
//  Copyright © 2020 rakesh karapu. All rights reserved.
//

import UIKit

class DropdownlistWithTitleCell: UITableViewCell{

    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
