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
    func decryptMessage(message: EncryptedMessage, password: String)
    func saveMessage(message: EncryptedMessage, password: String)
    func updateMessage(message: String)
}

protocol MessagesView {
    
    var presenter: MessagesPresenter? { get set }
    
    /**
     * Communication PRESENTER -> VIEW
     * (how the view should be known from the presenter)
     */
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
    func decryptDidSucceeded()
    func decryptDidFailed(error: String)
}

protocol MessagesInteractorInput {
    
    var presenter: MessagesInteractorOutput? { get set }
    
    /**
     * Communication PRESENTER -> INTERACTOR
     * (how the interactor should be known from the presenter)
     */
    func saveMessage(message: EncryptedMessage)
    func decrypMessage(password: String)
}

