//
//  ValidateInput.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

// TODO rename into ValidationRules
protocol ValidateInput {
    
    func validEmail(email: String) -> Bool
    func passwordNotEmpty(password: String) -> Bool
}
