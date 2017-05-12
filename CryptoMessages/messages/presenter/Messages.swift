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
    
    func saveMessage(content: String?, password: String?) {
    
        if let currentInteractor = interactor, let c = content, let p = password {
            
            currentInteractor.saveMessage(content: c, password: p)
        } else {
            
            view?.showErrorMessage(message: "SAVE_MESSAGE_FAILDED".localized)
        }
    }
    
    func updateMessage(message: EncryptedMessage) {
        
        if let currentInteractor = interactor {
            
            currentInteractor.updateMessage(message: message)
        } else {
            
            view?.showErrorMessage(message: "UPDATE_MESSAGE_FAILDED".localized)
        }
    }
    
    func getAllMessages() {
        
        interactor?.getAllMessages()
    }
    
    // MARK: - MessagesInteractorOutput implementation
    func decryptDidFailed(error: String) {
        
        view?.showErrorMessage(message: error)
    }
    
    func getAllMessagesDidSucceeded(messages: [EncryptedMessage]) {
        
        view?.showMessages(data: messages)
    }
    
    func saveDidSucceeded(message: EncryptedMessage) {
        
        view?.refreshMessages(message: message)
    }
    
    func decryptDidSucceeded(content: String) {
        
        view?.showMessageContent(message: content)
        view?.enableSaving()
        view?.allowDecryptMessage(status: false)
    }
}
