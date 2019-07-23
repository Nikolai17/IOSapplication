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
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextFieldLogin: UITextField!
    @IBOutlet weak var outPutLabel: UILabel!
    
    var presenter: LoginPresenter!
  
    @IBAction func loginButton(_ sender: Any) {
        presenter.loginButtonPressed()
    }
    
    func setWarninigText(_ message: String) {
        outPutLabel.text = message
    }
    
    func gotoNextScreen() {
        if let nc = navigationController {
            let vc = ViewController(nibName: "ViewController", bundle: nil)
            nc.pushViewController(vc, animated: true)
        }
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = LoginPresenter(view: self, model: LoginModel())
    }


}

