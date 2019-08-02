//
//  AddTems.swift
//  PenzaAuto
//
//  Created by gitlab on 01/08/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import Foundation
import UIKit

class AddTems: UIViewController {
    weak var prevVC: ForumViewController!
    var presenter: AddPresenter!
    
    @IBOutlet weak var topicName: UILabel!
    @IBOutlet weak var authorName: UILabel!
    
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var descriptionOutlet: UILabel!
    @IBOutlet weak var topicTextField: UITextField!
    @IBOutlet weak var authorTextField: UITextField!
    
    @IBAction func DoneButton(_ sender: Any) {
       prevVC.tems.append(Topic.init(topicName: topicTextField.text!, authorName: authorTextField.text!, ratingPlus: 44, ratingMinus: 33, description: descriptionTextField.text!, lock: UIImage(named: "closedLock")!))
        
        presenter.pressButton()
        
        prevVC.tableView.reloadData()
        navigationController?.popViewController(animated: true)
        
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = AddPresenter(view: self , model: AddModel())
        

    }
    
    static func startForumView(NC: UINavigationController ,prevVC: ForumViewController) {
    let regVC = AddTems.init(nibName: "AddTopic" , bundle: nil)
    NC.pushViewController(regVC, animated: true)
    regVC.prevVC = prevVC        
    }
}
