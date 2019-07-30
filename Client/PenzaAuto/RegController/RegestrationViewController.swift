//
//  RegestrationViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 30/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//


import UIKit

class RegestrationViewController: UIViewController {
    
    @IBOutlet weak var regButton: UIButton!
    @IBOutlet weak var passReTypeTextField: UITextField!
    @IBOutlet weak var passTextField: UITextField!
    
    @IBOutlet weak var loginTextField: UITextField!
    
    
    @IBAction func regButton(_ sender: Any) {
        if passTextField.text == passReTypeTextField.text {
           print("Пароли совпадают!")
        } else {
            print("Пароли не совпадают!")
        }
        
    }
    
    @objc func leftClick(param: Any) {
        print("Left Click")
    }
    override func viewDidLoad() {
       self.navigationItem.rightBarButtonItem = nil
       self.navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem:.redo, target: self, action: #selector (leftClick(param:)))
    }
    
}
