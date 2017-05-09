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
        
        services.allMessages()
    }
    
    func decrypMessage(password: String) {
        
        
    }
}
