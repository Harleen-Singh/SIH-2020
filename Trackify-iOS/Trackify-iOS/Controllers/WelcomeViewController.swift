//
//  ViewController.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/19/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//


import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.text = ""
        var multiplier = 0.0
        
        for letter in K.appName {
            Timer.scheduledTimer(withTimeInterval: 0.1 * multiplier, repeats: false) { (Timer) in
                self.titleLabel.text?.append(letter)
            // or do with delay method
            }
            multiplier += 1
        }

       
    }
    

}
