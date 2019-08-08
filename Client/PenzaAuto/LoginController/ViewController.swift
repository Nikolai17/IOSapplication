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
    
    @IBOutlet weak var loginButtonOutlets: UIButton!
    var presenter: LoginPresenter!
  
   
    @IBAction func loginButton(_ sender: Any) {
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
        if let nc = self.navigationController {            
            RegestrationViewController.startRegView(NC: nc, prevVC: self)
        }
    }
    
    
    func changeLabel(msg: String?) {
        self.outPutLabel?.text = msg
    }
    
    func setLogFields(log: String, pass: String) {
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        outPutLabel.text = ""
        enableLoginButton(state: true)
        loginTextField.text = Consts.adminName
        passTextFieldLogin.text = Consts.adminPassword
        loginTextField.delegate = self
        passTextFieldLogin.delegate = self
        self.presenter = LoginPresenter(view: self, model: LoginModel())
    }
    
    private func enableLoginButton(state: Bool) {
        loginButtonOutlets.isEnabled = state
        switch state {
        case true:
            loginButtonOutlets.setTitleColor(ProjectColors.whiteColor, for: .normal)
        case false:
            loginButtonOutlets.setTitleColor(ProjectColors.translucentWhiteColor, for: .normal)
        default:
            break
        }
    }
  
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if let text = textField.text, let range = Range(range, in: text) {
            let updatedText = text.replacingCharacters(in: range, with: string)
            switch textField {
            case loginTextField:
                presenter.loginChange(text: updatedText)
                if updatedText.count < 4 || passTextFieldLogin.text?.count ?? 0 < 4 {
                    enableLoginButton(state: false)
                } else {
                    enableLoginButton(state: true)
                }
            case passTextFieldLogin:
                presenter.passChange(text: updatedText)
                if updatedText.count < 4 || loginTextField.text?.count ?? 0 < 4  {
                    enableLoginButton(state: false)
                } else {
                    enableLoginButton(state: true)
                }
            default: break
            }
            
        }
        return true
    }
    
}

        

   
    



