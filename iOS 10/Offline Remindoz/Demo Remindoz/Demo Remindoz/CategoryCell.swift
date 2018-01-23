//
//  CategoryCell.swift
//  Demo Remindoz
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet weak var categoryIcon: UIImageView!
    @IBOutlet weak var categoryName: UILabel!
    



    func configureCell(cell:Category){
        
        categoryName.text = cell.category_name
        categoryIcon.image = cell.category_icon as? UIImage
        
    }
}
