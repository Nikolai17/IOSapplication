//
//  LoginPresenter.swift
//  PenzaAuto
//
//  Created by gitlab on 19/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import Alamofire


class LoginPresenter {
    
    var login: String = ""
    var pass: String = ""
    var printText:String = ""
    
    weak var view: ViewController!
    var model: LoginModel
    
    init(view: ViewController, model: LoginModel) {
        self.view = view
        self.model = model
    }
    
    
    func loginButtonPressed() {
        login =  view.loginTextField!.text!
        pass = view.passTextFieldLogin!.text!
        model.modelKeyPressed(completion: { (result) -> Void in
            guard let res = result else { return }
            self.view.changeLabel(msg: res.getLoginState(self.pass))
            self.view.goToNextScreen(self.view!.outPutLabel.text!)
        }, login: login, pass: pass)
        
        view.textFieldDidBeginEditing(view.loginTextField)
        
    }
    
    
    
}
