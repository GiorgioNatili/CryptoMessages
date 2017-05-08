//
//  AuhtenticationScenario.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

protocol AuthenticationPresenter {
    
    var view: AuthenticationView? { get set }
    var interactor: AuthenticationInteractorInput? { get set }
    var router: AuthenticationRouting? { get set }
    
    /**
     * Communication VIEW -> PRESENTER
     * (how the presenter should be known from the view)
     */
    func authenticate(username: String, password: String)
    func resetPassword(email: String)
}

protocol AuthenticationView {
    
    var presenter: AuthenticationPresenter? { get set }
    
    /**
     * Communication PRESENTER -> VIEW
     * (how the view should be known from the presenter)
     */
    func showErrorMessage(message: String)
    func showAuthenticationStatus(status: String)
    func enableUserInterface(status:  Bool)
}

protocol AuthenticationInteractorOutput {
    
    /**
     * Communication INTERACTOR -> PRESENTER
     * (completion handlers impelemented by the presenter,
     * this is how the presenter should be known from the interactor)
     */
    func loginDidSucceeded()
    func loginDidFailed(error: String)
}

protocol AuthenticationInteractorInput {
    
    var presenter: AuthenticationInteractorOutput? { get set }
    
    /**
     * Communication PRESENTER -> INTERACTOR
     * (how the interactor should be known from the presenter)
     */
    func aunthenticate(user: User)
    func resetPassword(email: String)
}

protocol AuthenticationRouting {
    
    func presentMessages()
}
