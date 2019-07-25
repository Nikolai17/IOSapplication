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
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    func goToNextScreen(_ temp: String) {
        if temp == "Вход выполнен успешно" {
            let newVC = ForumViewController.init(nibName: "ForumViewController", bundle: nil)
            self.navigationController?.pushViewController(newVC, animated: true)
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) -> Bool {
        print(textField.text)
        return true
    }
    
    func changeLabel(msg: String) -> String {
        self.outPutLabel.text = msg
        return msg
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.delegate = self
        self.presenter = LoginPresenter(view: self, model: LoginModel())
       
        
    }


}

