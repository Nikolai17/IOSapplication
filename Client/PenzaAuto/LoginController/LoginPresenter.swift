//
//  LoginPresenter.swift
//  PenzaAuto
//
//  Created by gitlab on 19/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation

class LoginPresenter {
    weak var view: ViewController!
    var model: LoginModel
    
    var login: String = "Volnikov"
    var pass: String = "1234"
    
    
    init(view: ViewController, model: LoginModel) {
        self.view = view
        self.model = model
    }
        
    func loginButtonPressed() {

        model.modelKeyPressed(completion: { (result) -> Void in
            guard let res = result else { return }
            self.view.changeLabel(msg: res.getLoginState(self.pass).0)
            self.view.goToNextScreen(self.view!.outPutLabel.text!, userType: res.getLoginState(self.pass).1 ?? UserType.errorLogin)
        }, login: login, pass: pass)   
      
    }
    
    func passChange(text: String){
        pass = text
    }
    
    func loginChange(text: String) {
        login = text
    }

    
    
}
