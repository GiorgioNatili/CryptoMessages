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
      
    init() {
        
        
    }
    
    // MARK: - AuthenticationInteractorOutput implementation
    func loginDidSucceeded() {
        
        router?.presentMessages()
    }
    
    func loginDidFailed(error: String) {
        
        view?.showErrorMessage(message: error)
    }
    
    // MARK: - AuthenticationPresenter implementation
    func authenticate(username: String, password: String) {
        
        interactor?.aunthenticate(user: User(username: username, password: password))
    }
    
    func resetPassword(email: String) {
        
        interactor?.resetPassword(email: email)
    }
    
}
