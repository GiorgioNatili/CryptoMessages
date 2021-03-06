//
//  MessagesScenario.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

protocol MessagesPresenter {
    
    var view: MessagesView? { get set }
    var interactor: MessagesInteractorInput? { get set }
    var currentMessageID: Int? { get set }
    
    /**
     * Communication VIEW -> PRESENTER
     * (how the presenter should be known from the view)
     */
    func getAllMessages()
    func decryptMessage(message: EncryptedMessage, password: String)
    func saveMessage(content: String?, password: String?)
    func updateMessage(message: EncryptedMessage)
}

protocol MessagesView {
    
    var presenter: MessagesPresenter? { get set }
    
    /**
     * Communication PRESENTER -> VIEW
     * (how the view should be known from the presenter)
     */
    func refreshMessages(message: EncryptedMessage)
    func showErrorMessage(message: String)
    func enableSaving()
    func showMessages(data: [EncryptedMessage])
    func showMessageContent(message: String)
    func allowSaveMessage(canSave: Bool)
    func allowDecryptMessage(status: Bool)
}

protocol MessagesInteractorOutput {
    
    /**
     * Communication INTERACTOR -> PRESENTER
     * (completion handlers impelemented by the presenter,
     * this is how the presenter should be known from the interactor)
     */
    func getAllMessagesDidSucceeded(messages: [EncryptedMessage])
    func saveDidSucceeded(message: EncryptedMessage)
    func decryptDidSucceeded(content: String)
    func decryptDidFailed(error: String)
}

protocol MessagesInteractorInput {
    
    var presenter: MessagesInteractorOutput? { get set }
    
    /**
     * Communication PRESENTER -> INTERACTOR
     * (how the interactor should be known from the presenter)
     */
    func getAllMessages()
    func saveMessage(content: String, password: String)
    func updateMessage(message: EncryptedMessage)
    func decryptMessage(message: EncryptedMessage, password: String)
}

