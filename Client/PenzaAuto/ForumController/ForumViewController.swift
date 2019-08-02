//
//  ForumViewController.swift
//  PenzaAuto
//
//  Created by gitlab on 25/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit
import SnapKit



class ForumViewController: UIViewController, UITableViewDataSource , UITableViewDelegate{
    @IBOutlet weak var tableView: UITableView!
    
    
    var userType: UserType?
    var presenter: ForumPresenter!
    let idCell = "idCell"
    var tems: [Topic] = []
    
    func createTems() -> [Topic] {
        var temp: [Topic] = []
        let topic1 = Topic(topicName: "Стук в движке", authorName: "Иванов", ratingPlus: 55, ratingMinus: 2, description: "нужно ремонтировать", lock: UIImage(named: "closedLock")!)
        let topic2 = Topic(topicName: "Стук в коробке", authorName: "Петров", ratingPlus: 33, ratingMinus: 4, description: "нужно продавать", lock: UIImage(named: "openLock")!)
        temp.append(topic1)
        temp.append(topic2)
        return temp
    }
    
 
    
    
    
    
    // количество ячеек
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return tems.count
    }
    // сама ячейка
   func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    /// Переиспользуем ячейки чтобы не нагружать память
        let tema = tems[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: idCell) as! AvtoTableViewCell
        cell.setTems(tema: tema)        
        return cell
    }
    ///   высота ячейки
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return  50.0
    }
    /// какая ячейка выбрана
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row)")
    }

 /// устанавливаем картинку в левую кнопку navigation item
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
  
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(userType)
        tableView.dataSource = self
        tableView.delegate = self
        
        tems = createTems()
        tableView.isScrollEnabled = true
        tableView.register(UINib(nibName: "AvtoTableViewCell", bundle: nil), forCellReuseIdentifier: idCell)
        
        self.navigationItem.title = UserName
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 115.0/255.0, green: 211.0/255.0, blue: 255.0/255.0, alpha: 1.0)
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:UIColor.white]
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem:.add, target: self, action: #selector (rightClick(param:)))
        
        self.presenter = ForumPresenter(view: self , model: ForumModel())
        presenter.captureForImage(userType: self.userType!)
      
      
    }
    
/// добавляет новую тему ( не готово)
    @objc func rightClick(param: Any){
        
        if let nc = self.navigationController {
            AddTems.startForumView(NC: nc, prevVC: self)
        }
        
        tableView.reloadData()
        print("Right click")
    }
    
/// открывает профиль пользователя ! ( не готово)
    @objc func leftClick(param: Any){
        print("Left click")
    }
    
// Делаем наш navigation bar снова видимым
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
       
    }
  
 
    
    
    /// удаление тем свайпом влево c правами доступа admin
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if userType == UserType.admin {
        return true
        } else {
            return false
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tems.remove(at: indexPath.row)
            tableView.beginUpdates()
            tableView.deleteRows(at: [indexPath], with: .automatic)
            tableView.endUpdates()
        }
    }
    
    
    
}
