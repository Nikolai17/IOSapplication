//
//  ViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 16/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit

protocol moveContent {
   func registerForKeyBoardNotifications()
   func removeKeyboardNotifications()
}

extension UIViewController
{
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(UIViewController.dismissKeyboard))
        
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard()
    {
        view.endEditing(true)
    }
}

class ViewController: UIViewController, UITextFieldDelegate, moveContent {
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet weak var signButton: UIButton!
    @IBOutlet weak var loginTextField: UITextField!
    @IBOutlet weak var passTextFieldLogin: UITextField!
    @IBOutlet weak var outPutLabel: UILabel!
    @IBOutlet weak var loginButtonOutlets: UIButton!
    var presenter: LoginPresenter!
   
    @IBAction func loginButton(_ sender: Any) {
        presenter.loginButtonPressed()
        loginTextField.resignFirstResponder()
        passTextFieldLogin.resignFirstResponder()
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
 
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        outPutLabel.text = ""
        enableLoginButton(state: true)
//        loginTextField.text = Consts.adminName
//        passTextFieldLogin.text = Consts.adminPassword
        loginTextField.delegate = self
        passTextFieldLogin.delegate = self
        self.presenter = LoginPresenter(view: self, model: LoginModel())
        registerForKeyBoardNotifications()
    }
        
       
    
    func registerForKeyBoardNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(kbWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    @objc func kbWillShow(_ notification: Notification){
        let userInfo = notification.userInfo
        let kbFrameSize = (userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
        scrollView.contentOffset = CGPoint(x:0, y: kbFrameSize.height)
    }
    
    @objc func kbWillHide(){
        scrollView.contentOffset = CGPoint.zero
    }
    
    deinit {
        removeKeyboardNotifications()
    }
    func removeKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
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

        

   
    



