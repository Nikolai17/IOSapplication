//
//  AddPresenter.swift
//  PenzaAuto
//
//  Created by gitlab on 02/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation

class AddPresenter {
    weak var view:  AddTems!
    var model: AddModel
    
    init(view: AddTems, model: AddModel) {
        self.view = view
        self.model = model
    }
    
    func pressButton() {
        model.modelKeyPressed(completion: { (result) -> Void in
            guard let res = result else { return }
            
           
        }, topicName: view.topicTextField.text!, authorName: view.authorTextField.text!, ratingPlus: 44, ratingMinus: 2,description: view.descriptionTextField.text!)
    }
}


