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
        if view.loginTextField?.text != nil && view.passTextFieldLogin?.text != nil {
            login =  String(view.loginTextField!.text!)
            pass = String(view.passTextFieldLogin!.text!)
            
        } else { return }
        
        printText =  model.loginButtonModel(login: login, pass: pass)
        view.setWarninigText(printText)
        //view.gotoNextScreen()
   
        }
    
 
    


}

