//
//  AuthenticationWiring.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationBehaviorWiring {
    
    var view: AuthenticationView
    
    init(_ view: AuthenticationView) {
        
        // Any additional operation goes here
        self.view = view
    }
    
    func configure() {
        
        let presenter = Authentication(validation: InputValidation())
        
        let router = AuthenticationRouter()
        let interactor = AuthenticationInteractor(services: FirebaseAuthentication())
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
    }
}
