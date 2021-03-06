//
//  AuthenticationInitizalization.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

class AuthenticationInitizalization: NSObject {
    
    // Connect with object on storyboard
    @IBOutlet weak var authenticationViewController: AuthenticationViewController!
    
    override func awakeFromNib() {
        
        let wiring = AuthenticationBehaviorWiring(authenticationViewController)
        wiring.configure()
    }
}
