//
//  MockMessagesInteractorOutput.swift
//  CryptoMessagesTests
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

@testable import CryptoMessages
class MockMessagesInteractorOutput : MessagesInteractorOutput {
    
    init() {
    
        self._decryptDidFailedShouldHaveBeenCalled = false
        self._saveDidSucceededShouldHaveBeenCalled = false
        self._decryptDidSucceededShouldHaveBeenCalled = false
        self._getAllMessagesDidSucceededHaveBeenCalled = false
    }
    
    private var _decryptDidFailedShouldHaveBeenCalled: Bool
    var decryptDidFailedShouldHaveBeenCalled: Bool {
        get {
            return _decryptDidFailedShouldHaveBeenCalled
        }
    }
    
    private var _saveDidSucceededShouldHaveBeenCalled: Bool
    var dsaveDidSucceededShouldHaveBeenCalled: Bool {
        get {
            return _saveDidSucceededShouldHaveBeenCalled
        }
    }
    
    private var _decryptDidSucceededShouldHaveBeenCalled: Bool
    var decryptDidSucceededShouldHaveBeenCalled: Bool {
        get {
            return _decryptDidSucceededShouldHaveBeenCalled
        }
    }
    
    private var _getAllMessagesDidSucceededHaveBeenCalled: Bool
    var getAllMessagesDidSucceededHaveBeenCalled: Bool {
        get {
            return _getAllMessagesDidSucceededHaveBeenCalled
        }
    }
    
    func decryptDidFailed(error: String) {
        
        _decryptDidFailedShouldHaveBeenCalled = true
    }
    
    func decryptDidSucceeded(content: String) {
        
        _decryptDidSucceededShouldHaveBeenCalled = true
    }
    
    func saveDidSucceeded(message: EncryptedMessage) {
        
        _decryptDidSucceededShouldHaveBeenCalled = true
    }
    
    func getAllMessagesDidSucceeded(messages: [EncryptedMessage]) {
        
        _decryptDidFailedShouldHaveBeenCalled = true
    }
    
}
