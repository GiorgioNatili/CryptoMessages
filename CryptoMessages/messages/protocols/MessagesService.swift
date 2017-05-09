//
//  MessagesService.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import RxSwift

protocol MessagesService {
    
    func allMessages() -> Observable<[EncryptedMessage]>
    func getMessage(id: Int) -> Observable<EncryptedMessage>
}
