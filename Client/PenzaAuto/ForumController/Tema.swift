//
//  Tema.swift
//  PenzaAuto
//
//  Created by gitlab on 01/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import UIKit

class Topic {
    
    var topicName: String
    var authorName: String
    var ratingPlus: Int
    var ratingMinus: Int
    var description: String
    var lock: UIImage
    
    init(topicName: String, authorName:String, ratingPlus: Int, ratingMinus: Int, description: String, lock: UIImage) {
        self.topicName = topicName
        self.authorName = authorName
        self.ratingPlus = ratingPlus
        self.ratingMinus = ratingMinus
        self.description = description
        self.lock = lock
    }
    
  
}
