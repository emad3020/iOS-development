//
//  GroupCell.swift
//  BreakPoint
//
//  Created by Emad on 12/19/17.
//  Copyright © 2017 Emad. All rights reserved.
//

import UIKit

class GroupCell: UITableViewCell {

    @IBOutlet weak var groupTitleLbl: UILabel!
    @IBOutlet weak var groupDescLbl: UILabel!
    @IBOutlet weak var memberCountLbl: UILabel!
    
    func configureCell(title: String, description: String, memberCount: Int){
        self.groupDescLbl.text = description
        self.groupTitleLbl.text = title
        self.memberCountLbl.text = "\(memberCount) members."
        
    }
}
