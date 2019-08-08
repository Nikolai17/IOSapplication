//
//  RegestrationViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 30/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//


import UIKit

class RegestrationViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var passReTypeTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    private weak var prevVC: ViewController!
    var presenter: RegPresenter!
    
    @IBAction func regButton(_ sender: Any) {
        if passTextField.text == passReTypeTextField.text {
            print("Пароли совпадают!")
            prevVC.loginTextField?.text = loginTextField?.text
            prevVC.passTextFieldLogin?.text = passTextField?.text
            self.navigationController?.popViewController(animated: true)
        } else {
            print("Пароли не совпадают!")
        }
        
    }
    
    @objc func leftClick(param: Any) {
        print("Left Click")
    }
    override func viewDidLoad() {
       self.presenter = RegPresenter(view: self , model: RegModel())
       self.navigationItem.rightBarButtonItem = nil
       self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:.redo, target: self, action: #selector (leftClick(param:)))
    }
    
    static func startRegView(NC: UINavigationController ,prevVC: ViewController) {
        let regVC = RegestrationViewController.init(nibName: Consts.nibNameRegScreen , bundle: nil)
        NC.pushViewController(regVC, animated: true)
        regVC.prevVC = prevVC
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
        
    }
    
}
