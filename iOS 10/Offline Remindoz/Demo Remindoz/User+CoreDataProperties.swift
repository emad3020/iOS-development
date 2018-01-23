//
//  User+CoreDataProperties.swift
//  Demo Remindoz
//
//  Created by Emad on 9/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var user_email: String?
    @NSManaged public var user_name: String?
    @NSManaged public var user_password: String?
    @NSManaged public var toCategory: NSSet?

}

// MARK: Generated accessors for toCategory
extension User {

    @objc(addToCategoryObject:)
    @NSManaged public func addToToCategory(_ value: Category)

    @objc(removeToCategoryObject:)
    @NSManaged public func removeFromToCategory(_ value: Category)

    @objc(addToCategory:)
    @NSManaged public func addToToCategory(_ values: NSSet)

    @objc(removeToCategory:)
    @NSManaged public func removeFromToCategory(_ values: NSSet)

}
