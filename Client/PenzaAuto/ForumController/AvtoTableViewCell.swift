//
//  AvtoTableViewCell.swift
//  PenzaAuto
//
//  Created by gitlab on 31/07/2019.
//  Copyright © 2019 gitlab. All rights reserved.
//

import UIKit

class AvtoTableViewCell: UITableViewCell {

    @IBOutlet weak var minusButtonOutlet: UIButton!
    @IBOutlet weak var plusButtonOutlet: UIButton!
    
    @IBAction func plusButton(_ sender: Any) {
        let allowedCharset = CharacterSet
            .decimalDigits
        let filteredText = String(plusIntegerCell.text!.unicodeScalars.filter(allowedCharset.contains))
        plusIntegerCell.text = String("+ \(Int(filteredText)! + 1)")
        plusButtonOutlet.isEnabled = false
        minusButtonOutlet.isEnabled = false
    }
    
    @IBAction func minusButton(_ sender: Any) {
       
        let allowedCharset = CharacterSet
            .decimalDigits        
        let filteredText = String(minusIntegerCell!.text!.unicodeScalars.filter(allowedCharset.contains))
        minusIntegerCell.text = String("- \(Int(filteredText)! + 1)")
        plusButtonOutlet.isEnabled = false
        minusButtonOutlet.isEnabled = false
        
    }
    @IBOutlet weak var topicCell: UILabel!
    @IBOutlet weak var authorCell: UILabel!
    @IBOutlet weak var plusIntegerCell: UILabel!
    @IBOutlet weak var minusIntegerCell: UILabel!
    @IBOutlet weak var lockCell: UIImageView!
    
    func setTems(tema: Topic) {
        topicCell.text = tema.topicName
        authorCell.text = tema.authorName
        plusIntegerCell.text = String("+ \(tema.ratingPlus)")
        minusIntegerCell.text = String("- \(tema.ratingMinus)")
        lockCell.image = tema.lock
      
    }
    

}
