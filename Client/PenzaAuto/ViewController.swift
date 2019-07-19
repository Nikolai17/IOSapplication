//
//  ViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 16/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {
    
    @IBOutlet weak var LoginTextField: UITextField!
    @IBOutlet weak var PassTextFieldLogin: UITextField!
    @IBOutlet weak var Output: UILabel!
    
    struct Autorization: Codable {
        var login: String
        var pass: String
        
    }
  
    @IBAction func LoginButton(_ sender: Any) {
        
        if let nc = navigationController {
            let vc = ViewController(nibName: "ViewController", bundle: nil)
            nc.pushViewController(vc, animated: true)
        }
 
//        let headers = ["Content-Type": "application/x-www-form-urlencoded" ]
//        let url = "http://localhost:4567/post"
//        if LoginTextField.text != nil && PassTextFieldLogin.text != nil {
//        request(url,
//                method: .post,
//                parameters: ["login": String(LoginTextField.text!), "pass": "True"]).responseJSON
//            { response in
//                if String(describing: response.result) == "SUCCESS" {
//                    let result = response.result.value
//                    let JSON = result as! NSDictionary
//
//                    if JSON == ["Volnikov":"True"] && self.PassTextFieldLogin.text == "1234" {
//                       self.Output.text = "Вы  авторизованы!"
//                    } else if JSON == ["Volnikov":"True"] && self.PassTextFieldLogin.text! != "1234" {
//                        self.Output.text = "Неверный пароль!"
//                    }
//                    if JSON == ["Fail":"Fail"] {
//                        self.Output.text = "Не верный логин и пароль!"
//                    }
//                 } else  {
//                       self.Output.text = "Нет подключения к серверу!"
//                       print(response)
//                 }
//            }
//        }

    }

    
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

