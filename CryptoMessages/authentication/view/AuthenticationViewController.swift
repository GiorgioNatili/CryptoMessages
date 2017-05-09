//
//  AuthenticationViewController.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import UIKit

class AuthenticationViewController: UIViewController, AuthenticationView {

    // MARK: - UI items
    @IBOutlet weak var welcomeLabel: UILabel!
    @IBOutlet weak var usernameLabel: UILabel!
    @IBOutlet weak var passwordLabel: UILabel!
    @IBOutlet weak var username: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var login: UIButton!
    @IBOutlet weak var errorMessage: UILabel!
    
    // MARK: - Instance members
    var presenter: AuthenticationPresenter?
   
    // MARK: - Livecycle override
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let wiring = AuthenticationBehaviorWiring(self)
        wiring.configure()
        
        updateContent()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Private methods
    func updateContent() {
        
        welcomeLabel.text = "WELCOME".localized
        usernameLabel.text = "LOGIN".localized
        passwordLabel.text = "PASSWORD".localized
        
        login.setTitle("LOGIN".localized, for: .normal)
        
        resetErrorMessage()
    }
    
    // MARK: - User interaction
    @IBAction func doLogin(sender: AnyObject) {
        
        presenter!.authenticate(username: username.text!, password: password.text!)
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: - AuthenticationView implementation
    func showErrorMessage(message: String) {
     
        errorMessage.text = message
    }
    
    func resetErrorMessage() {
        
        errorMessage.text = ""
    }
    
    func showAuthenticationStatus(status: String) {
        
        errorMessage.text = status
    }
    
    func enableUserInterface(status:  Bool) {
     
        username.isEnabled = status
        password.isEnabled = status
        login.isEnabled = status
    }
}
