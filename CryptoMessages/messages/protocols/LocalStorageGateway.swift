//
//  LocalStorageGateway.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/9/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import CoreData

protocol LocalStorageGateway {
    
    func fetchMessagesOnLocalStorage() throws -> ((_ : NSManagedObjectContext ) throws -> [EncryptedMessage])
    func saveMessageOnLocalStorage(message: EncryptedMessage) throws -> ((_ : NSManagedObjectContext ) throws -> EncryptedMessage)
    func updateMessageOnLocalStorage(message: EncryptedMessage) throws -> ((_ : NSManagedObjectContext ) throws -> EncryptedMessage)
}
