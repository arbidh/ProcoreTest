//
//  DiffTableViewCell.swift
//  ProcoreCodingTest
//
//  Created by Rinie Ghazali on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class DiffTableViewCell: UITableViewCell {

    @IBOutlet weak var txtViewDiff: UITextView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
