//
//  TryFetchingMessageWithoutPasswordTest.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/9/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import XCTest
import Quick
import Nimble
import CoreData
@testable import CryptoMessages

class DecryptMessageTest: QuickSpec {
    
    var messagesInteractorOutput: MockMessagesInteractorOutput!
    var messagesInteractorInput: MessagesInteractorInput!
    var managedObjectContext: NSManagedObjectContext!
    
    func setUpInMemoryManagedObjectContext() -> NSManagedObjectContext {
        
        let managedObjectModel = NSManagedObjectModel.mergedModel(from: [Bundle.main])!
        
        let persistentStoreCoordinator = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
        
        do {
            try persistentStoreCoordinator.addPersistentStore(ofType: NSInMemoryStoreType, configurationName: nil, at: nil, options: nil)
        } catch {
            print("Adding in-memory persistent store failed")
        }
        
        let managedObjectContext = NSManagedObjectContext(concurrencyType:.privateQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = persistentStoreCoordinator
        
        return managedObjectContext
    }
    
    override func spec() {
        
        describe("Test the encryption use cases") {
            
            beforeEach {
                
                self.messagesInteractorOutput = MockMessagesInteractorOutput()
                
                let gateway = CoreDataLocalStorage()
                let services = LocalMessageService(localStorageGateway: gateway)
                self.messagesInteractorInput = MessagesInteractor(services: services)
                
                self.messagesInteractorInput.presenter = self.messagesInteractorOutput
                
                if self.managedObjectContext == nil {
                    self.managedObjectContext = self.setUpInMemoryManagedObjectContext()
                }
            }
            
            it("It should not decrtypt the message with a wrong password") {
                
                let entity = NSEntityDescription.entity(forEntityName: "EncryptedMessage", in: self.managedObjectContext!)
                let encryptedMessage = EncryptedMessage(entity: entity!, insertInto: self.managedObjectContext)
                
                encryptedMessage.content = "I am a secure message"
                encryptedMessage.password = "12345"
                
                self.messagesInteractorInput.decryptMessage(message: encryptedMessage, password: "::definitely not 12345::")
                
                expect(self.messagesInteractorOutput.decryptDidFailedShouldHaveBeenCalled).to(beTruthy())
                expect(self.messagesInteractorOutput.decryptDidSucceededShouldHaveBeenCalled).to(beFalsy())
            }
            
            it("It should decrtypt the message with the correct password") {
                
                let entity = NSEntityDescription.entity(forEntityName: "EncryptedMessage", in: self.managedObjectContext!)
                let encryptedMessage = EncryptedMessage(entity: entity!, insertInto: self.managedObjectContext)
                
                encryptedMessage.content = "I am a secure message"
                encryptedMessage.password = "12345"
                
                self.messagesInteractorInput.decryptMessage(message: encryptedMessage, password: "12345")
                
                expect(self.messagesInteractorOutput.decryptDidFailedShouldHaveBeenCalled).to(beFalsy())
                expect(self.messagesInteractorOutput.decryptDidSucceededShouldHaveBeenCalled).to(beTruthy())
            }
        }
    }
}
