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
    func getLoginState(_ pass: String) -> (String, UserType?) {
        switch self as? [String: String] {
        case [Consts.adminName : Consts.nameTrue]:
            if pass == Consts.adminPassword {
                userName = Consts.adminName
                return (Consts.loginSuccessful, UserType.admin)
            } else {
                return (Consts.incorrectPasswordEntered, nil)
            }
        case [Consts.userName : Consts.nameTrue]:
            if pass == Consts.userPassword {
                userName = Consts.userName
                return (Consts.loginSuccessful, UserType.user)
            } else {
                return (Consts.incorrectPasswordEntered, nil)
            }
        default: return (Consts.loginFailed, nil)
        }
    }    
}

class LoginModel {
    
    
   
    func modelKeyPressed(completion: @escaping([String : String]?) -> Void, login: String, pass: String) {
        let url = Consts.nameLocalHost
        let parameters = [Consts.nameLogin: login, Consts.namePassword: pass]
        request(url,
                method: .post,
                parameters: parameters).responseJSON { response in
                    if String(describing: response.result) == Consts.nameSUCCESS {
                        let result = response.result.value
                        guard let JSON = result as? [String : String] else { return }
                        completion(JSON)
                    }
                }
    }
}


