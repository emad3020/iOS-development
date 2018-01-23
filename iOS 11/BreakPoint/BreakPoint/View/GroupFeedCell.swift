//
//  GroupFeedCell.swift
//  BreakPoint
//
//  Created by Emad on 12/19/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit

class GroupFeedCell: UITableViewCell {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    
    @IBOutlet weak var contentLbl: UILabel!
    
    
    func configureCell(profileImage: UIImage,email: String, content: String) {
        self.profileImage.image = profileImage
        self.emailLbl.text = email
        self.contentLbl.text = content
        
    }
}
