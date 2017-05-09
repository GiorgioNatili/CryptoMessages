//
//  LocalMessagesService.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import RxSwift

class LocalMessageService: MessagesService {
    
    let gateway: LocalStorageGateway
    
    init(localStorageGateway: LocalStorageGateway) {
    
        self.gateway = localStorageGateway
    }
    
    // MARK: - MessagesService implementation
    func allMessages() -> Observable<[EncryptedMessage]> {
        
        return Observable.create { observer in
          
            do {
                
                let messages = try self.gateway.manageAccessToContext(handler: self.gateway.fetchMessagesOnLocalStorage())
                
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
                
                let newMessage = try self.gateway.manageAccessToContext(handler: self.gateway.saveMessageOnLocalStorage(message: message))
                
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
                
                let newMessage = try self.gateway.manageAccessToContext(handler: self.gateway.updateMessageOnLocalStorage(message: message))
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
