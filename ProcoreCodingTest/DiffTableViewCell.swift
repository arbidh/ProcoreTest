//
//  DiffTableViewCell.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

class DiffTableViewCell: UITableViewCell {

    @IBOutlet weak var txtViewDiff: UILabel!
    
    @IBOutlet weak var LineNumberBar: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }

}
