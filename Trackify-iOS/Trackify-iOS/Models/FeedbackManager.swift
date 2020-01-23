//
//  FeedbackManager.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/22/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//

import Foundation

struct FeedbackManager {
    let feedbackURL = ""
    
    
    func fetchFeedback() {
        let urlString = feedbackURL
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    self.parseJSON(feedbackData: safeData)
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(feedbackData: Data) {
        
        
    }
    
}
