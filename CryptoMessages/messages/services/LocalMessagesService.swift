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
    
    init() {
    
    }
    
    func allMessages() -> Observable<[EncryptedMessage]> {
        
        return Observable.create { observer in
            
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                
                let managedContext = appDelegate.persistentContainer.viewContext
                
                let messages: [EncryptedMessage]
                let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "EncryptedMessage")
                
                do {
                    
                    messages = try managedContext.fetch(fetchRequest) as! [EncryptedMessage]
                    observer.onNext(messages)
                    observer.onCompleted()
                } catch let error as NSError {
                    
                    let fetchError = FetchError(details: error.userInfo.description, errorCode: error.code)
                    observer.onError(fetchError)
                }
                
            } else {
            
                let error = FetchError(details: "Something went wrong accessing the app shared", errorCode: 101)
                observer.onError(error)
            }
            
            return Disposables.create()
        }
    }
    
    func getMessage(id: Int) -> Observable<EncryptedMessage> {
        
        // TODO read the local data and return the object
        return Observable.from(optional: EncryptedMessage())
    }
}
