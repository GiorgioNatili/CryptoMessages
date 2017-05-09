//
//  LocalMessagesService.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import RxSwift
import CoreData

class LocalMessageService: MessagesService {
    
    let localStorageGateway: LocalStorageGateway
    
    init(localStorageGateway: LocalStorageGateway) {
    
        self.localStorageGateway = localStorageGateway
    }
    
    func manageAccessToContext<T>(handler: (_ : NSManagedObjectContext) throws -> T) throws -> T {
        
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            
            let managedContext = appDelegate.persistentContainer.viewContext

            return try handler(managedContext)
            
        } else {
            
            throw FetchError(details: "Something went wrong accessing the app shared", errorCode: 101)
        }
    }
    
    // MARK: - MessagesService implementation
    func allMessages() -> Observable<[EncryptedMessage]> {
        
        return Observable.create { observer in
          
            do {
                
                let messages = try self.manageAccessToContext(handler: self.localStorageGateway.fetchMessagesOnLocalStorage())
                
                observer.onNext(messages)
                observer.onCompleted()
            
            } catch let fetchError as FetchError {
                
                observer.onError(fetchError)
            }  catch let error as NSError {
                
                let fetchError = FetchError(details: error.userInfo.description, errorCode: error.code)
                observer.onError(fetchError)
            }
            
            return Disposables.create()
        }
    }
    
    func saveMessage(message: EncryptedMessage) -> Observable<EncryptedMessage> {
        
        return Observable.create { observer in
            
            do {
                
                let newMessage = try self.manageAccessToContext(handler: self.localStorageGateway.saveMessageOnLocalStorage(message: message))
                observer.onNext(newMessage)
                observer.onCompleted()
                
                
            } catch let fetchError as FetchError {
                
                observer.onError(fetchError)
            }  catch let error as NSError {
                
                let fetchError = FetchError(details: error.userInfo.description, errorCode: error.code)
                observer.onError(fetchError)
            }
            
            return Disposables.create()
        }
    }
    
    func updateMessage(message: EncryptedMessage) -> Observable<EncryptedMessage> {
        
        return Observable.create { observer in
            
            do {
                
                let newMessage = try self.manageAccessToContext(handler: self.localStorageGateway.updateMessageOnLocalStorage(message: message))
                observer.onNext(newMessage)
                observer.onCompleted()
                
            } catch let fetchError as FetchError {
                
                observer.onError(fetchError)
            }  catch let error as NSError {
                
                let fetchError = FetchError(details: error.userInfo.description, errorCode: error.code)
                observer.onError(fetchError)
            }
            
            return Disposables.create()
            
        }
    }
    
    func getMessage(id: Int) -> Observable<EncryptedMessage> {
        
        // TODO read the local data and return the object
        return Observable.from(optional: EncryptedMessage())
    }
}
