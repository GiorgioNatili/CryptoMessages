//
//  AuthenticationRouting.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import UIKit

class AuthenticationRouter: AuthenticationRouting {
    
    var window: UIWindow?
    
    enum SegueIdentifiers: String {
        
        case MesseagesList = "MesseagesList"
    }
    
    init() {
        
        self.window = UIApplication.shared.delegate!.window!
    }
    
    func presentMessages() {
        
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let navigationController = UINavigationController()
     
        let view = mainStoryboard.instantiateViewController(withIdentifier: SegueIdentifiers.MesseagesList.rawValue) as! MessagesViewController
        
        navigationController.pushViewController(view, animated: false)
        window?.rootViewController = navigationController
    }
}
