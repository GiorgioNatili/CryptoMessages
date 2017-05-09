//
//  LocalMessagesService.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import RxSwift

class LocalMessageService: MessagesService {

    init() {
        
    }
    
    func allMessages() -> Observable<[Message]> {
        
        // TODO return the array from local data
        return Observable.from(optional: [Message()])
    }
    
    func getMessage(id: Int) -> Observable<Message> {
        
        // TODO read the local data and return the object
        return Observable.from(optional: Message())
    }
}
