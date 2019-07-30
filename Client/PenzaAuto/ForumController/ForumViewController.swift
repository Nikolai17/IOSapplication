//
//  ForumViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 25/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit
import SnapKit



class ForumViewController: UIViewController {
    @IBOutlet var labelWelcome: UILabel!
    var userType: UserType?
    var presenter: ForumPresenter!
    
    
//    func navigationLeftButtonImageAdmin() {
//
//        let button = UIButton.init(type: .custom)
//        //set image for button
//        button.setImage(UIImage(named: Consts.stringAdmin), for: UIControl.State.normal)
//        //add function for button
//        button.addTarget(self, action: #selector(leftClick(param:)), for: UIControl.Event.touchUpInside)
//        //set frame
//        button.frame = CGRect(x: Consts.cgrectX, y: Consts.cgrectY, width: Consts.cgrectWight, height: Consts.cgrectHeight)
//
//        let barButton = UIBarButtonItem(customView: button)
//        //assign button to navigationbar
//        self.navigationItem.leftBarButtonItem = barButton
//    }
    
    func navigationLeftButtonImage(_ text: String) {
        
        let button = UIButton.init(type: .custom)
        //set image for button
        button.setImage(UIImage(named: text), for: UIControl.State.normal)
        //add function for button
        button.addTarget(self, action: #selector(leftClick(param:)), for: UIControl.Event.touchUpInside)
        //set frame
        button.frame = CGRect(x: Consts.cgrectX, y: Consts.cgrectY, width: Consts.cgrectWight, height: Consts.cgrectHeight)
        
        let barButton = UIBarButtonItem(customView: button)
        //assign button to navigationbar
        self.navigationItem.leftBarButtonItem = barButton
    }
    
    func create() {
    let image = UIImage(named: Consts.stringAdmin)
    }  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = UserName
        create()
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector (rightClick(param:)))
        self.presenter = ForumPresenter(view: self , model: ForumModel())
        presenter.captureForImage(userType: self.userType!)
    }
    

    @objc func rightClick(param: Any){
        print("Right click")
    }
    
    @objc func leftClick(param: Any){
        print("Left click")
    }
    
// Делаем наш navigation bar снова видимым
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
       
    }
    
}
