//
//  RegPresent.swift
//  PenzaAuto
//
//  Created by gitlab on 31/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation

class RegPresenter {
    
    weak var view: RegestrationViewController!
    var model: RegModel
    
    init(view: RegestrationViewController, model: RegModel) {
        self.view = view
        self.model = model
    }
    
}
