//
//  LoginModel.swift
//  PenzaAuto
//
//  Created by gitlab on 19/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import Alamofire

extension Dictionary {
    func getLoginState(_ pass: String) -> String {
        switch self as? [String: String] {
        case ["Volnikov" : "True"]:
            return pass == "1234" ? "Вход выполнен успешно" : "Введен некорректный пароль"
        default: return "Ошибка входа"
        }
    }
    
}

class LoginModel {
    
    enum Users {
        case admin
        case ussally
    }
    
    func typeUser(_ login: String ,_ pass: String) -> Any {
        if login == "Volnikov" && pass == "1234" {
           return Users.admin
        } else { return Users.ussally }
    }
    
    static var keyValue = "123"
    var temp: String = ""
    
    func modelKeyPressed(completion: @escaping([String : String]?) -> Void, login: String, pass: String) {
        let url = "http://localhost:4567/post"
        request(url,
                method: .post,
                parameters: ["login": login, "pass": "True"]).responseJSON { response in
                    if String(describing: response.result) == "SUCCESS" {
                        let result = response.result.value
                        guard let JSON = result as? [String : String] else { return }
                        completion(JSON)
                    }
                }
    }
}
