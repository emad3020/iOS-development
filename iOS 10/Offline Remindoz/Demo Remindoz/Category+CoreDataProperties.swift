//
//  Category+CoreDataProperties.swift
//  Demo Remindoz
//
//  Created by Emad on 9/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation
import CoreData


extension Category {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Category> {
        return NSFetchRequest<Category>(entityName: "Category")
    }

    @NSManaged public var category_icon: NSObject?
    @NSManaged public var category_name: String?
    @NSManaged public var toUser: User?
    @NSManaged public var toMemory: NSSet?

}

// MARK: Generated accessors for toMemory
extension Category {

    @objc(addToMemoryObject:)
    @NSManaged public func addToToMemory(_ value: Memory)

    @objc(removeToMemoryObject:)
    @NSManaged public func removeFromToMemory(_ value: Memory)

    @objc(addToMemory:)
    @NSManaged public func addToToMemory(_ values: NSSet)

    @objc(removeToMemory:)
    @NSManaged public func removeFromToMemory(_ values: NSSet)

}
