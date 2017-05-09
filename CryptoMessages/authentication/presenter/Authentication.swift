//
//  Authentication.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

class Authentication : AuthenticationPresenter, AuthenticationInteractorOutput {
    
    var view: AuthenticationView?
    var interactor: AuthenticationInteractorInput?
    var router: AuthenticationRouting?
    
    let validateInput: ValidateInput
      
    init(validation: ValidateInput) {
        
        self.validateInput = validation
    }
    
    // MARK: - AuthenticationInteractorOutput implementation
    func loginDidSucceeded() {
        
        router?.presentMessages()
    }
    
    func loginDidFailed(error: String) {
        
        view?.showErrorMessage(message: error)
        view?.enableUserInterface(status: true)
    }
    
    // MARK: - AuthenticationPresenter implementation
    func authenticate(username: String, password: String) {
        
        view?.resetErrorMessage()
        
        guard validateInput.validEmail(email: username) else {
            
            view?.showErrorMessage(message: "USERNAME_IS_VALID_EMAIL".localized)
            return
        }
        
        guard validateInput.passwordNotEmpty(password: password) else {
            
            view?.showErrorMessage(message: "MISSING_PASSWORD".localized)
            return
        }
        
        view?.enableUserInterface(status: false)
        interactor?.aunthenticate(user: User(username: username, password: password))
    }
    
    func resetPassword(email: String) {
        
        interactor?.resetPassword(email: email)
    }
}
