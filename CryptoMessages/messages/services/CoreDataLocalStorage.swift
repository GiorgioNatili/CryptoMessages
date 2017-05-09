//
//  CoreDataLocalStorage.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/9/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataLocalStorage : LocalStorageGateway {
    
    func manageAccessToContext<T>(handler: (_ : NSManagedObjectContext) throws -> T) throws -> T {
        
        // REFACTOR Move this AppDelegate up the call stack, which would eliminate dependency on UIKit
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let managedContext = appDelegate.persistentContainer.viewContext
            
            return try handler(managedContext)
            
        } else {
            
            throw FetchError(details: "Something went wrong accessing the app shared", errorCode: 101)
        }
    }
    
    func fetchMessagesOnLocalStorage() throws -> ((_ : NSManagedObjectContext ) throws -> [EncryptedMessage]) {
        
        return { (managedContext: NSManagedObjectContext) throws -> [EncryptedMessage] in
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EncryptedMessage")
            
            do {
                
                return try managedContext.fetch(fetchRequest) as! [EncryptedMessage]
            } catch let error as NSError {
                
                throw FetchError(details: error.userInfo.description, errorCode: error.code)
            }
        }
    }
    
    func saveMessageOnLocalStorage(message: EncryptedMessage) throws -> ((_ : NSManagedObjectContext ) throws -> EncryptedMessage) {
        
        return { (managedContext: NSManagedObjectContext) throws -> EncryptedMessage in
            
            let entity = NSEntityDescription.entity(forEntityName: "EncryptedMessage", in: managedContext)!
            let newMessage = NSManagedObject(entity: entity, insertInto: managedContext) as! EncryptedMessage
            
            newMessage.setValue(message.content, forKeyPath: "content")
            newMessage.setValue(message.password, forKeyPath: "password")
            
            do {
                
                try managedContext.save()
                return newMessage
                
            } catch let error as NSError {
                
                throw FetchError(details: error.userInfo.description, errorCode: error.code)
            }
        }
    }
    
    func updateMessageOnLocalStorage(message: EncryptedMessage) throws -> ((_ : NSManagedObjectContext ) throws -> EncryptedMessage) {
        
        return { (managedContext: NSManagedObjectContext) throws -> EncryptedMessage in
            
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EncryptedMessage")
            fetchRequest.predicate = NSPredicate(format: "id = %@", message.id)
            
            if let fetchResults = try managedContext.fetch(fetchRequest) as? [EncryptedMessage] {
                
                if fetchResults.count != 0 {
                    
                    let updatedMessage = fetchResults[0]
                    
                    updatedMessage.setValue(message.content, forKey: "content")
                    updatedMessage.setValue(message.password, forKey: "password")
                    
                    try! managedContext.save()
                    
                    return updatedMessage
                    
                } else {
                    
                    throw FetchError(details: "Message \(message.id) not found", errorCode: 105)
                }
                
            } else {
                
                throw FetchError(details: "Fetching for the message \(message.id) miserably failed", errorCode: 102)
            }
        }
    }

}
