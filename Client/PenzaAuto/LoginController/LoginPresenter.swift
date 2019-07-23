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
    
    
    
    
    func LoginButtonPressed() {
        if view.LoginTextField?.text != nil && view.PassTextFieldLogin?.text != nil {
            login =  String(view.LoginTextField!.text!)
            pass = String(view.PassTextFieldLogin!.text!)
            
        } else { return }
        let headers = ["Content-Type": "application/x-www-form-urlencoded" ]
        let url = "http://localhost:4567/post"
        
        if login != nil && pass != nil {
            request(url,
                    method: .post,
                    parameters: ["login": login, "pass": "True"]).responseJSON
                { response in
                    if String(describing: response.result) == "SUCCESS" {
                        let result = response.result.value
                        let JSON = result as! NSDictionary
                        
                        if JSON == ["Volnikov":"True"] && self.pass == self.model.keyValue {
                            self.printText = "Вы  авторизованы!"
                        } else if JSON == ["Volnikov":"True"] && self.pass != self.model.keyValue {
                           self.printText = "Неверный пароль!"
                        }
                        if JSON == ["Fail":"Fail"] {
                            self.printText = "Не верный логин и пароль!"
                        }
                    } else  {
                       self.printText = "Нет подключения к серверу!"
                        print(response)
                    }
            }
        }
        
      
    }
}
