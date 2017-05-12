//
//  MessagesViewController+Extension.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/9/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import Foundation
import UIKit

extension MessagesViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return allMessages.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let message = allMessages[indexPath.row]
        selectedMessage = message
        
        prepareForDecryption()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let message = allMessages[indexPath.row]
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "MessageCell")
        cell.textLabel?.text = message.id.description
        
        return cell
    }
}
