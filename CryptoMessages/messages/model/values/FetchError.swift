//
//  FetchError.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/9/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

struct FetchError: Error {
    
    var details: String
    var errorCode: Int?
}
