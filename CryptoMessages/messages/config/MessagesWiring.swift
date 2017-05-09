//
//  MessagesWiring.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation

class MessagesWiring {
    
    var view: MessagesView
    
    init(_ view: MessagesView) {
        
        // Any additional operation goes here
        self.view = view
    }
    
    func configure() {
        
        let presenter = Messages()
        
        let interactor = MessagesInteractor()
        
        presenter.view = view
        presenter.interactor = interactor
        
        view.presenter = presenter
        interactor.presenter = presenter
    }

}
