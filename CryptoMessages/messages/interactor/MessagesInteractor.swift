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
    
    init(){
        
        services = LocalMessageService()
    }
    
    // MARK: - MessageInteractorInput implementation
    func saveMessage(message: Message) {
        
        services.allMessages()
            
        
    }
    
    func decrypMessage(password: String) {
        
        
    }
}
