//
//  MemoryItemCell.swift
//  Demo Remindoz
//
//  Created by Emad on 9/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class MemoryItemCell: UITableViewCell {

    @IBOutlet weak var memoryImage: UIImageView!
    
    @IBOutlet weak var memoryDescribtion: UILabel!
    
    func configMemoryUI(cell:Memory) {
        memoryImage.image = cell.memory_image as? UIImage
        memoryDescribtion.text = cell.memory_description
    }
}
