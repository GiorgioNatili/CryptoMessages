//
//  Message+CoreDataProperties.swift
//  
//
//  Created by Giorgio Natili on 5/8/17.
//
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Message {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Message> {
        return NSFetchRequest<Message>(entityName: "Message");
    }

    @NSManaged public var content: String?
    @NSManaged public var password: String?

}
