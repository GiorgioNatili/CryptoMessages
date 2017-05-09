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
    func decryptMessage(message: Message, password: String) {
        
        // TODO implement encrypting
        if message.password == password {
            
            view?.showMessageContent(message: message.content!)
        }
    }
    
    func saveMessage(message: Message, password: String) {
        
        // TODO use coredata to save the messages
    }
    
    func updateMessage(message: String) {
        
        //
    }
    
    // MARK: - MessagesInteractorOutput implementation
    func decryptDidFailed(error: String) {
        
        //
    }
    
    func decryptDidSucceeded() {
        
        //
    }
}
