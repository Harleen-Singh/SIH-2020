//
//  ViewController.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/19/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//

import UIKit
import FirebaseAuth

class OutputSelectViewController: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var reviewIdSelector: UIPickerView!
    @IBOutlet weak var productIdTextView: UITextField!
    
    var classifier = ["Fashion","TBD","TBD","TBD"]
    
    var feedbacks: [Feedback] = [Feedback(comment: "", sentiment: "")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        reviewIdSelector.dataSource = self
        reviewIdSelector.delegate = self
        
    }
    
    @IBAction func LogoutButtonPressed(_ sender: UIBarButtonItem) {
        
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
          print ("Error signing out: %@", signOutError)
        }
          
    }
    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return classifier.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        // put here heading array
        return classifier[row]
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    @IBAction func feedbacksButtonPressed(_ sender: UIButton) {
        
        // find messages
        
        let productId = productIdTextView.text!
        
        let feedbackManager = FeedbackManager(Id: productId)
        
        feedbackManager.fetchFeedback()
        
        print(feedbackManager.feedbackURL)
        
        
        
        self.performSegue(withIdentifier: "goToFeedbacks", sender: self)
        
        
        
    }
    
    @IBAction func overallRatingButtonPressed(_ sender: UIButton) {
        
        //find overall Rating
        
        self.performSegue(withIdentifier: "goToOverallRating", sender: self)
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFeedbacks" {
            
            let destinationVC = segue.destination as! FeedbackViewController
            
            destinationVC.feedbacks = feedbacks
            
        }
        
        if segue.identifier == "goToOverallRating" {
            
            let destinationVC = segue.destination as! RatingViewController
            destinationVC.overallRatingValue = "0.0"
            
        }
        
    }
    
    

}

