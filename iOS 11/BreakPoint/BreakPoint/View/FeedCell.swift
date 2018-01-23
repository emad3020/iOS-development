//
//  FeedCell.swift
//  BreakPoint
//
//  Created by Emad on 12/13/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit

class FeedCell: UITableViewCell {
 
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var emailLbl: UILabel!
    @IBOutlet weak var contentLbl: UILabel!
    
    
    func configureCell(email:String , content: String){
        self.emailLbl.text = email
        self.contentLbl.text = content
    }
}
