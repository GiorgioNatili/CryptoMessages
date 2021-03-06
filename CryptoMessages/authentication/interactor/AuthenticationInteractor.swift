//
//  AuthenticationInteractor.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

class AuthenticationInteractor: AuthenticationInteractorInput {
    
    var presenter: AuthenticationInteractorOutput?
    var services: AuthenticagionServices
    
    init(services: AuthenticagionServices){
        
        self.services = services
    }
    
    // MARK: - AuthenticationInteractorInput implementation
    func aunthenticate(user: User) {
        
        services.auhtenticate(user: user).subscribe {
            
            // TODO handle the error case
            print($0)
            self.presenter?.loginDidSucceeded()
        }
    }
    
    func resetPassword(email: String) {
        
        // TODO implement the reset password method
    }
    
}
