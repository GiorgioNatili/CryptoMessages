//
//  MessagesInteractor.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

class MessagesInteractor: MessagesInteractorInput {
    
    var presenter: MessagesInteractorOutput?
    var services: MessagesService
    
    init(services: MessagesService){
        
        self.services = services
    }
    
    // MARK: - MessageInteractorInput implementation
    func saveMessage(message: EncryptedMessage) {
        
        services.saveMessage(message: message)
            .subscribe {
                
                self.presenter?.saveDidSucceeded(message: message)
        }
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
