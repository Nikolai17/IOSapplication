//
//  ViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 16/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextFieldLogin: UITextField!
    @IBOutlet weak var outPutLabel: UILabel!
    
    var presenter: LoginPresenter!
  
    @IBAction func LoginButton(_ sender: Any) {

        presenter.loginButtonPressed()
        outPutLabel.text = presenter.printText
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

