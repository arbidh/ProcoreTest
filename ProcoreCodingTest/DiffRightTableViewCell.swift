//
//  DiffRightTableViewCell.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/29/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class DiffRightTableViewCell: UITableViewCell {
    @IBOutlet weak var label: UILabel!

    @IBOutlet weak var lineNumberView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code

    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
