//
//  ViewController.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/19/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//


import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    

    @IBAction func loginPressed(_ sender: UIButton) {
        
        if let email = emailTextfield.text, let password = passwordTextfield.text {
            
            
            Auth.auth().signIn(withEmail: email, password: password) { (authResult, error) in
                if error != nil {
                    let alert = UIAlertController(title: "Alert", message: error?.localizedDescription, preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "Okay", style: UIAlertAction.Style.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
                
                else
                {
                    self.performSegue(withIdentifier: "SignInToOutputSelect", sender: self)
                }
            }
            
        }
    
        
    }
    
}
