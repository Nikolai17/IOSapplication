//
//  ViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 16/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextFieldLogin: UITextField!
    @IBOutlet weak var outPutLabel: UILabel!
    
    var presenter: LoginPresenter!
  
    @IBAction func LoginButton(_ sender: Any) {
        presenter.loginButtonPressed()
    }
    
    override func viewWillAppear(_ animated: Bool) {
         self.navigationController?.isNavigationBarHidden = true
    }
    
    func goToNextScreen(_ temp: String, userType: UserType) {
        if temp == Consts.loginSuccessful {
            let newVC = ForumViewController.init(nibName: Consts.nibNameSecondScreen , bundle: nil)
            newVC.userType = userType
            self.navigationController?.pushViewController(newVC, animated: true)
            
        }
    }   
   
    @IBAction func signButtonAction(_ sender: Any) {
        
        let newVC = RegestrationViewController.init(nibName: Consts.nibNameRegScreen , bundle: nil)
       
        self.navigationController?.pushViewController(newVC, animated: true)
    }
    
    
    func changeLabel(msg: String) {
        self.outPutLabel.text = msg
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loginTextField.text = Consts.adminName
        passTextFieldLogin.text = Consts.adminPassword
        loginTextField.delegate = self
        passTextFieldLogin.delegate = self
        self.presenter = LoginPresenter(view: self, model: LoginModel())
        
    }
  
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
            switch textField {
            case loginTextField:
                presenter.loginChange(text: updatedText)
            case passTextFieldLogin:
                presenter.passChange(text: updatedText)
            default: break
            }
            
        }
        return true
    }
    
}

        

   
    



