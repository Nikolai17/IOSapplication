//
//  LoginModel.swift
//  PenzaAuto
//
//  Created by gitlab on 19/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import Alamofire

class LoginModel {
    
    var keyValue = "1234"
    var outPutValue:String = ""
    
   
    
    
    func loginButtonModel(login: String , pass: String) -> String {
      
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
                        
                        if JSON == ["Volnikov":"True"] && pass == self.keyValue {
                            self.outPutValue = "Вы  авторизованы!"
                        } else if JSON == ["Volnikov":"True"] && pass != self.keyValue {
                            self.outPutValue = "Неверный пароль!"
                        }
                        if JSON == ["Fail":"Fail"] {
                            self.outPutValue = "Не верный логин и пароль!"
                        }
                    } else  {
                        self.outPutValue = "Нет подключения к серверу!"
                        print(response)
                    }
            }
           
        }
         return outPutValue
    }

}
