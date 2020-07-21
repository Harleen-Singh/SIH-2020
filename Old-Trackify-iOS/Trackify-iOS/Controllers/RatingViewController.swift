//
//  RatingViewController.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/19/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class RatingViewController: UIViewController {
    
    @IBOutlet weak var overallRatingValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        
        overallRatingValueLabel.text = "4"
        
    }
    
    
    
    
    @IBAction func LogoutButtonPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
        
    }
    
    
    
    
    
}
