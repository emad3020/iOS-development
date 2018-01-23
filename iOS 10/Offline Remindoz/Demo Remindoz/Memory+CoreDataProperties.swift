//
//  Memory+CoreDataProperties.swift
//  Demo Remindoz
//
//  Created by Emad on 9/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation
import CoreData


extension Memory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Memory> {
        return NSFetchRequest<Memory>(entityName: "Memory")
    }

    @NSManaged public var memory_description: String?
    @NSManaged public var memory_image: NSObject?
    @NSManaged public var toCategory: Category?

}
