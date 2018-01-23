//
//  Item+CoreDataClass.swift
//  DreamLister
//
//  Created by Emad on 9/3/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation
import CoreData


public class Item: NSManagedObject {

    public override func awakeFromInsert() {
        
        super.awakeFromInsert()
        
        self.created = NSDate()
    }
}
