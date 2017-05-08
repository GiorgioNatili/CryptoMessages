//
//  AuthenticationService.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import ObjectMapper
import RxAlamofire
import RxSwift

class AuthenticationServices: AuthenticagionServices {
    
    var fakeAuthentication:String
    var fakeLogout:String
    
    init() {
        
        self.fakeAuthentication = "https://jsonplaceholder.typicode.com/posts"
        self.fakeLogout = "https://jsonplaceholder.typicode.com/users"
    }
    
    // MARK: - AuthenticationServices implementation
    func auhtenticate(user: User) -> Observable<AnyObject> {
        
        return JSON(.GET, fakeAuthentication).observeOn(MainScheduler.instance)
    }
    
    func logout() -> Observable<AnyObject> {
        
        return JSON(.GET, fakeLogout).observeOn(MainScheduler.instance)
    }
}
