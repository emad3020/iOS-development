//
//  NoteCell.swift
//  Demo Note
//
//  Created by Emad on 8/29/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import Firebase

class NoteCell: UITableViewCell {

    @IBOutlet weak var note_title_label: UILabel!
    @IBOutlet weak var note_content_label: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    func updateUI(title: String , content:String){
        
        note_title_label.text = title
        note_content_label.text = content
        
    }

}
