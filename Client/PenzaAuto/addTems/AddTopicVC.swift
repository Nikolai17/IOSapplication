//
//  AddTems.swift
//  PenzaAuto
//
//  Created by gitlab on 01/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import UIKit

class AddTopicVC: UIViewController {
    weak var prevVC: ForumViewController!
    var presenter: AddPresenter!
    
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Создание темы"
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.action, target: self, action: #selector (rightClick(param:)))
        self.presenter = AddPresenter(view: self , model: AddModel())
    }
    
    @objc func rightClick(param: Any){        
        prevVC.tems.append(Topic.init(topicName: topicTextField.text!, authorName: authorTextField.text!, ratingPlus: 44, ratingMinus: 33, description: descriptionTextField.text!, lock: UIImage(named: "closedLock")!))
        presenter.pressButton()
        navigationController?.popViewController(animated: true)
    }
    
    static func startForumView(NC: UINavigationController ,prevVC: ForumViewController) {
        let regVC = AddTopicVC.init(nibName: "AddTopic" , bundle: nil)
        NC.pushViewController(regVC, animated: true)
        prevVC.refresh()
        regVC.prevVC = prevVC
    }
}
