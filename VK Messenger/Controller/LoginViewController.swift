//
//  LoginViewController.swift
//  VK Messenger
//
//  Created by Nikolay on 31/10/2018.
//  Copyright © 2018 Nikolay Rybin. All rights reserved.
//

import UIKit
import VK_ios_sdk

class LoginViewController: UIViewController {
    
    let messenger = Messenger()
    
    @IBOutlet weak var loginButton: UIButton!
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = messenger.lightBackgroundColor
        loginButton.backgroundColor = messenger.lightActiveLoginButtonColor
        
    }
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }


    
    
    
}
