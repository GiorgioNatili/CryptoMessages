//
//  AuthenticationServices.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import RxSwift

protocol AuthenticagionServices {
    
    func auhtenticate(user: User) -> Observable<User>
    func logout() -> Observable<User>
}
