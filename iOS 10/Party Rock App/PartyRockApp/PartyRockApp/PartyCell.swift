//
//  PartyCell.swift
//  PartyRockApp
//
//  Created by Emad on 8/22/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class PartyCell: UITableViewCell {

    @IBOutlet weak var videoPreviewImage: UIImageView!
    
    @IBOutlet weak var videoTitle: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func updateUI(partyRock: PartRock){
        videoTitle.text = partyRock.videoTitle
        
        let url = URL(string: partyRock.imageURL)!
        
        DispatchQueue.global().async {
            do {
                let data = try Data(contentsOf: url)
                DispatchQueue.global().async {
                    self.videoPreviewImage.image = UIImage(data: data)
                }
            } catch  {
            }
        }
        
    }

}
