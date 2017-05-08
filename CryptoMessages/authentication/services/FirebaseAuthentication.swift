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

class FirebaseAuthentication: AuthenticagionServices {
    
    let session = URLSession.shared
    
    var fakeAuthentication:String
    var fakeLogout:String
    
    init() {
        
        self.fakeAuthentication = "https://jsonplaceholder.typicode.com/posts"
        self.fakeLogout = "https://jsonplaceholder.typicode.com/users"
    }
    
    // MARK: - AuthenticationServices implementation
    func auhtenticate(user: User) -> Observable<User> {
        
        return Observable.create { observer in
            
            json(.get, self.fakeAuthentication)
                .subscribe({ data in
                    
                    // TODO handle the http codes
                    let authenticatedUser = User(username: user.username, password: "", status: UserStatus(authenticated: true))
                    observer.onNext(authenticatedUser)
                })
        }
    }
    
    func logout() -> Observable<User> {
        
        return Observable.create { observer in
            
            json(.get, self.fakeLogout)
                .subscribe({ data in
                    
                    observer.onNext(User(username: "", password: ""))
                })
        }
    }
}
