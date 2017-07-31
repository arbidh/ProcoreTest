//
//  GitPullTableViewCell.swift
//  ProcoreCodingTest
//
//  Created by Arbi Derhartunian on 7/28/17.
//  Copyright © 2017 arbiapps. All rights reserved.
//

import UIKit

//This is the Call that holds the list of all the pull requests
class GitPullTableViewCell: UITableViewCell {

    @IBOutlet weak var pullReqTitleLabel: UILabel!
    @IBOutlet weak var dateOpenedByOwnerLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        let shadowPath2 = UIBezierPath(rect: self.bounds)
        self.layer.backgroundColor = UIColor.gray.cgColor
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 5.0)
        self.layer.shadowOpacity = 0.5
        self.layer.shadowPath = shadowPath2.cgPath;
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
