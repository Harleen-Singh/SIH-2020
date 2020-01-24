//
//  FeedbackManager.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/22/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//

import Foundation

class FeedbackManager {
    let feedbackURL = "https://a4c289af.ngrok.io/"
    let productId: String
    var feedback: [Feedback]
    
    init(Id: String) {
        productId = Id
        feedback = [Feedback(comment: " ", sentiment:" ")]
    }
    
    
    func fetchFeedback() {
        let urlString = feedbackURL
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        
        if let url = URL(string: urlString) {
            
            let session = URLSession(configuration: .default)
            
            let task = session.dataTask(with: url) {(data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    //print(safeData)
                    //let dataString = String(data: safeData, encoding: .utf8)
                    //print(dataString!)
                    self.parseJSON(feedbackData: safeData)
                }
            }
            
            task.resume()
            
        }
        
    }
    
    func parseJSON(feedbackData: Data)  {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(FeedbackData.self, from: feedbackData)
            print(productId)
            print(decodedData.productId[0])
            var i = 0
            
           // let feeed: [Feedback]
            
            while productId != decodedData.productId[i] {
                i = i + 1
            }



            while productId == decodedData.productId[i] {

//                feedback[j].comment = decodedData.reviewText[i]
//                feedback[j].sentiment = decodedData.prediction[i]
                let feed = Feedback(comment: decodedData.reviewText[i], sentiment: decodedData.prediction[i])
                
                feedback.append(feed)
                i = i + 1

            }
            
           //print(feedback[2].comment)
            
            
//            while(i < decodedData.productId.count)
//            {
//                if productId == decodedData.productId[i]
//                {
//                    let feed = Feedback(comment: decodedData.reviewText[i], sentiment: decodedData.prediction[i])
//                    feedback.append(feed)
//
//
//                }
//                j = j + 1
//                i = i + 1
//
//            }
        
        
        
        
        
        
        
        } catch {
            print(error)
            
        }
        
        
        
    }
    
}
