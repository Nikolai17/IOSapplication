//
//  AddModel.swift
//  PenzaAuto
//
//  Created by gitlab on 02/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import Alamofire

class AddModel {
    
    func modelKeyPressed(completion: @escaping([String : String]?) -> Void, topicName:  String, authorName: String ,ratingPlus: Int,ratingMinus: Int ,description: String ) {
        let url = Consts.getTopicsUrl
        let params = ["topicName": topicName,
                      "authorName": authorName,
                      "ratingPlus" : "\(ratingPlus)",
                      "ratingMinus" : "\(ratingMinus)",
                      "decription" : description]
        request(url,
                method: .post,
                parameters: params).responseJSON { response in
                    if String(describing: response.result) == Consts.nameSUCCESS {
                        let result = response.result.value
                        guard let JSON = result as? [String : String] else { return }
                        
                        completion(JSON)
                    }
        }
    }
}


