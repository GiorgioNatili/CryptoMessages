//
//  MessagesViewController.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/8/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import UIKit

class MessagesViewController: UIViewController, MessagesView {

    // MARK: - UI Elements
    
    @IBOutlet weak var encryptLabel: UILabel!
    @IBOutlet weak var handleEncrypt: UIButton!
    @IBOutlet weak var saveMessage: UIButton!
    @IBOutlet weak var messageContent: UITextView!
    @IBOutlet weak var messages: UITableView!
    @IBOutlet weak var encryptingPassword: UITextField!
    
    // MARK: - Instance members
    var presenter: MessagesPresenter?
    
    enum States: Int {
        
        case DECRYPT = 10
        case SAVE = 20
    }
    
    // MARK: - Livecycle override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let messagesWiring = MessagesWiring(self)
        messagesWiring.configure()
        
        updateContent()
    }
    
    // MARK: - Private methods
    func updateContent() {
        
        encryptLabel.text = "ENCRYPT".localized
        
        saveMessage.setTitle("SAVE_MESSAGE".localized, for: .normal)
        handleEncrypt.setTitle("ENCRYPT_MESSAGE".localized, for: .normal)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - User interaction
    
    @IBAction func doUpdatedMessage(_ sender: Any) {
        
        presenter?.updateMessage(message: messageContent.text!)
    }
    
    @IBAction func doHandleEncrypting(_ sender: UIButton) {
        
        if sender.tag == States.SAVE.rawValue {
            
            // TODO pass the current message
            presenter?.saveMessage(message: Message(),
                                   password: encryptingPassword.text!)
        }
        
        if sender.tag == States.DECRYPT.rawValue {
            
            presenter?.decryptMessage(message: Message(), password: encryptingPassword.text!)
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
    func showMessages(data: [Message]) {
        
        // TODO UITableViewDataSource
        // messages.dataSource = data
    }
    
    func showMessageContent(message: String) {
        
        messageContent.text = message
    }
    
    func allowSaveMessage(canSave: Bool) {
        
        saveMessage.isHidden = canSave
    }
    
    func allowDecryptMessage(status: Bool) {
        
        handleEncrypt.isHidden = status
    }
}

