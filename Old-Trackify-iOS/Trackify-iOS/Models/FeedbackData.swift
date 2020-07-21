//
//  feedbackData.swift
//  Trackify-iOS
//
//  Created by UIET_MAC3 on 1/23/20.
//  Copyright © 2020 Harleen Singh. All rights reserved.
//

import Foundation

struct FeedbackData: Codable {
    
    var productId: [String]
    var reviewText: [String]
    var classification: [String]
    var prediction: [String]
}
