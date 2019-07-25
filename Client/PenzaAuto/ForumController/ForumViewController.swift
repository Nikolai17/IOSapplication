//
//  ForumViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 25/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit

class ForumViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = " Вы авторизованы!"
        
    }
    
    @IBOutlet var labelWelcome: UILabel!

// Делаем наш navigation bar снова видимым
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
       
    }
    
    
}
