//
//  AuthenticationViewControllerTest.swift
//  CryptoMessages
//
//  Created by Giorgio Natili on 5/7/17.
//  Copyright © 2017 Giorgio Natili. All rights reserved.
//

import UIKit
import Quick
import Nimble
@testable import CryptoMessages

class AuthenticationViewControllerTest: QuickSpec {
        
    override func spec() {
        
        var viewController: AuthenticationViewController!
        beforeEach {
            
            let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
            viewController = storyboard.instantiateInitialViewController() as! AuthenticationViewController
            
            UIApplication.shared.keyWindow!.rootViewController = viewController
        }
        
        describe(".viewDidLoad()") {
            beforeEach {
                
                // Access the view to trigger BananaViewController.viewDidLoad().
                let _ =  viewController.view
            }
            
            it("It should contains labels, text inputs, etc.") {
                
                // Since the controls are only initialized when the view is loaded, this
                // would fail if we didn't access the view in the `beforeEach` above.
                expect(viewController.username).notTo(beNil())
                expect(viewController.usernameLabel).notTo(beNil())
                expect(viewController.password).notTo(beNil())
                expect(viewController.passwordLabel).notTo(beNil())
                expect(viewController.errorMessage).notTo(beNil())
                expect(viewController.login).notTo(beNil())
            }
        }
        
        describe("dynamic text rendering", {
            
            beforeEach {
                
                // Triggers .viewDidLoad(), .viewWillAppear(), and .viewDidAppear() events.
                viewController.beginAppearanceTransition(true, animated: false)
                viewController.endAppearanceTransition()
            }
            
            it("It should load resources from a locale file") {
                
                expect(viewController.usernameLabel.text).toEventuallyNot(contain("Label"))
                expect(viewController.passwordLabel.text).toEventuallyNot(contain("Label"))
                expect(viewController.errorMessage.text).toEventuallyNot(contain("Label"))
            }
        })
        
        describe("Input field validation") {
            beforeEach {
                
                // Access the view to trigger AuthenticationViewController.viewDidLoad().
                let _ =  viewController.view
            }
            
            it("It should render an error message when username and password are missing"){
                
                viewController.login.sendActions(for: UIControlEvents.touchUpInside)
                
                expect(viewController.errorMessage.text?.characters.count).toEventually(beGreaterThan(0), timeout: 1)
            }
            
            it("It should render an error message the password is missing"){
                
                viewController.username.text = "Hannibal"
                viewController.login.sendActions(for: UIControlEvents.touchUpInside)
                
                expect(viewController.errorMessage.text?.characters.count).toEventually(beGreaterThan(0), timeout: 1)
            }
            
            it("It should render an error message the username is missing"){
                
                viewController.password.text = "The cannibal"
                viewController.login.sendActions(for: UIControlEvents.touchUpInside)
                
                expect(viewController.errorMessage.text?.characters.count).toEventually(beGreaterThan(0), timeout: 1)
            }
            
            it("It should render an error message if the username and password fiels are filled but username is not an email"){
                
                viewController.username.text = "Hannibal"
                viewController.password.text = "thecannibal"
                viewController.login.sendActions(for: UIControlEvents.touchUpInside)
                
                expect(viewController.errorMessage.text?.characters.count).toEventually(beGreaterThan(0))
            }
            
            it("It should not render any error message if the username and password fiels are correctly filled"){
                
                viewController.username.text = "hannibal@thecannibal.com"
                viewController.password.text = "thecannibal"
                viewController.login.sendActions(for: UIControlEvents.touchUpInside)
                
                expect(viewController.errorMessage.text).toEventually(beEmpty(), timeout: 1)
            }
        }
        
        describe("Input field validation") {
            beforeEach {
                
                // Access the view to trigger AuthenticationViewController.viewDidLoad().
                let _ =  viewController.view
            }
        }
        
    }
}
