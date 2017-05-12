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
    
    func manageAccessToContext<T>(handler: (_ : NSManagedObjectContext) throws -> T) throws -> T 
    func fetchMessagesOnLocalStorage() throws -> ((_ : NSManagedObjectContext ) throws -> [EncryptedMessage])
    func saveMessageOnLocalStorage(content: String, password: String) throws -> ((_ : NSManagedObjectContext ) throws -> EncryptedMessage)
    func updateMessageOnLocalStorage(message: EncryptedMessage) throws -> ((_ : NSManagedObjectContext ) throws -> EncryptedMessage)
}
