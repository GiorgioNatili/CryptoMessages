//
//  Messages.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

class Messages : MessagesPresenter, MessagesInteractorOutput {
    
    var currentMessageID: Int?    
    var interactor: MessagesInteractorInput?
    var view: MessagesView?
    
    init() {
        //
    }
    
    // MARK: - MessagesPresenter implementation
    func decryptMessage(message: EncryptedMessage, password: String) {
        
        interactor?.decryptMessage(message: message, password: password)
    }
    
    func saveMessage(message: EncryptedMessage, password: String) {
        
        // TODO use coredata to save the messages
    }
    
    func updateMessage(message: String) {
        
        //
    }
    
    // MARK: - MessagesInteractorOutput implementation
    func decryptDidFailed(error: String) {
        
        //
    }
    
    func saveDidSucceeded(message: EncryptedMessage) {
        //
    }
    
    func decryptDidSucceeded(content: String) {
        
         view?.showMessageContent(message: content)
    }
}
