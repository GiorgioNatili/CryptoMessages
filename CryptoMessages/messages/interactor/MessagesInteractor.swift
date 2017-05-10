//
//  MessagesInteractor.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import RxSwift

class MessagesInteractor: MessagesInteractorInput {
    
    private let bag = DisposeBag()
    var presenter: MessagesInteractorOutput?
    var services: MessagesService
    
    init(services: MessagesService){
        
        self.services = services
    }
    
    // MARK: - MessageInteractorInput implementation
    func saveMessage(message: EncryptedMessage) {
        
        services.saveMessage(message: message)
            .subscribe (onNext: { data in
                
                self.presenter?.saveDidSucceeded(message: data)
            })
            .addDisposableTo(bag)
    }
    
    func getAllMessages() {
        
        services.allMessages()
            .subscribe (onNext: { data in
                
                self.presenter?.getAllMessagesDidSucceeded(messages: data)
            })
            .addDisposableTo(bag)
            }
    
    func updateMessage(message: EncryptedMessage) {
        
        services.updateMessage(message: message)
            .subscribe (onNext: { data in
                
                self.presenter?.saveDidSucceeded(message: data)
            })
            .addDisposableTo(bag)
    }
    
    func decryptMessage(message:EncryptedMessage, password: String) {
     
        // TODO Decrypt services to be implemented, with CryptoSwift
        if message.password == password {
            
            presenter?.decryptDidSucceeded(content: message.content!)
        } else {
            
            presenter?.decryptDidFailed(error: "PASSWORD_DONT_MATCH".localized)
        }
    }
}
