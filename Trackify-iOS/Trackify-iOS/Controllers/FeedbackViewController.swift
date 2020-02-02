//
//  ViewController.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/19/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class FeedbackViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    
    var feedbacks: [Feedback] = [
        Feedback(comment: "Waaay too small. Will use for future child", sentiment:"Positive"),
        Feedback(comment: "These insoles help my heels feel much better.", sentiment:"Positive"),
        Feedback(comment: "As described", sentiment:"Positive"),
        Feedback(comment: "I just wish they would not roll down.", sentiment:"Negative")

    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self

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


extension FeedbackViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedbacks.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.detailTextLabel?.text = feedbacks[indexPath.row].sentiment
        cell.textLabel?.text = feedbacks[indexPath.row].comment
        
        return cell
        
    }
    
    
}
