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
    
    var presenter: LoginPresenter!
  
    @IBAction func LoginButton(_ sender: Any) {

        presenter.LoginButtonPressed()
        Output.text = presenter.printText
      
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

