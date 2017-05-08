//
//  InputValidation.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import SwiftValidators

class InputValidation: ValidateInput {

    
    func validEmail(email: String) -> Bool {
        
        return Validator.isEmail().apply(email)
    }
    
    func passwordNotEmpty(password: String) -> Bool {
        
        return !Validator.isEmpty().apply(password)
    }    
}
