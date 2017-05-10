//
//  MessagesViewController.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import UIKit
import CoreData

class MessagesViewController: UIViewController, MessagesView {

    // MARK: - UI Elements
    
    @IBOutlet weak var encryptLabel: UILabel!
    @IBOutlet weak var handleEncryptButton: UIButton!
    @IBOutlet weak var saveMessageButton: UIButton!
    @IBOutlet weak var messageContentTextView: UITextView!
    @IBOutlet weak var messagesTable: UITableView!
    @IBOutlet weak var encryptingPasswordTextField: UITextField!
    
    // MARK: - Instance members
    var presenter: MessagesPresenter?
    var selectedMessage: EncryptedMessage?
    var allMessages: [EncryptedMessage] = []
    
    // MARK: - Livecycle override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let messagesWiring = MessagesWiring(self)
        messagesWiring.configure()
        
        messagesTable.register(UITableViewCell.self,  forCellReuseIdentifier: "Cell")
        
        updateContent()
        presenter?.getAllMessages()
    }
    
    // MARK: - Private methods
    func updateContent() {
        
        encryptLabel.text = "ENCRYPT".localized
        
        saveMessageButton.setTitle("SAVE_MESSAGE".localized, for: .normal)
        handleEncryptButton.setTitle("ENCRYPT_MESSAGE".localized, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - User interaction
    
    @IBAction func doSaveMessage(_ sender: Any) {
        
        if let message = selectedMessage {
            
            presenter?.updateMessage(message: message)
        } else {
            
            // TODO move the buidling in a factory
            if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
                
                let managedContext = appDelegate.persistentContainer.viewContext
                
                let entity = NSEntityDescription.entity(forEntityName: "EncryptedMessage", in: managedContext)
                let newMessage = EncryptedMessage(entity: entity!, insertInto: managedContext)
                
                newMessage.id = Int32(Int(arc4random_uniform(3)))
                newMessage.content = messageContentTextView.text
                newMessage.password = encryptingPasswordTextField.text
                
                presenter?.saveMessage(message: newMessage)
            }
        }
    }
    
    @IBAction func doHandleEncrypting(_ sender: UIButton) {
        
        if let message = selectedMessage {
        
            presenter?.decryptMessage(message: message, password: encryptingPasswordTextField.text!)
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - MessagesView implementation
    func showMessages(data: [EncryptedMessage]) {
        
        // TODO UITableViewDataSource
        allMessages = data
        messagesTable.reloadData()
    }
    
    func showErrorMessage(message: String) {
        
        // TODO implement error
        print(message)
    }
    
    func refreshMessages() {
        
        messagesTable.reloadData()
    }
    
    func showMessageContent(message: String) {
        
        messageContentTextView.text = message
    }
    
    func allowSaveMessage(canSave: Bool) {
        
        saveMessageButton.isHidden = canSave
    }
    
    func allowDecryptMessage(status: Bool) {
        
        handleEncryptButton.isHidden = status
    }
}

