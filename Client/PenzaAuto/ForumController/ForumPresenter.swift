//
//  ForumPresenter.swift
//  PenzaAuto
//
//  Created by gitlab on 25/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation

class ForumPresenter {
    weak var view: ForumViewController!
    var model: ForumModel
    
    init(view: ForumViewController, model: ForumModel) {
        self.view = view
        self.model = model
    }
  
    func captureForImage(userType: UserType) {
        switch userType  {
        case .admin:
            view.navigationLeftButtonImage(Consts.stringAdmin)
        case .user:
            view.navigationLeftButtonImage(Consts.stringUsers)
        default: break
        }
    }
    
    
    
  
}
