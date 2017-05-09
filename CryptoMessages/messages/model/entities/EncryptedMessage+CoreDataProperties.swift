//
//  EncryptedMessage+CoreDataProperties.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/9/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import CoreData


extension EncryptedMessage {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<EncryptedMessage> {
        return NSFetchRequest<EncryptedMessage>(entityName: "EncryptedMessage");
    }

    @NSManaged public var id: Int32
    @NSManaged public var content: String?
    @NSManaged public var password: String?
}
