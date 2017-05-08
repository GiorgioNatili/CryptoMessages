//
//  User.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

struct User {
    
    var username: String
    var password: String
    var status: UserStatus?
    
    init(username: String, password: String, status: UserStatus? = nil) {
        
        self.username = username
        self.password = password
        self.status = status
    }
}
