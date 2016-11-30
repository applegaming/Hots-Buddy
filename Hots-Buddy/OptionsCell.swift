
//
//  OptionsCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/10/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class OptionsCell: UICollectionViewCell {
    
    
    @IBOutlet weak var optionLabel: UILabel!
    @IBOutlet weak var switchToggle: UISwitch!
    @IBAction func switchTogglePressed(_ sender: UISwitch) {
        if switchToggle.isOn {
            //switchToggle.setOn(false, animated: false)
            print("executed on statement")
            userOptions[sender.tag][1] = "true"
            saveToDefaults("userOptions")
        
            
            
            
        } else {
            print("executed off statement")
            //switchToggle.setOn(true, animated: false)
            userOptions[sender.tag][1] = "false"
            saveToDefaults("userOptions")
            
        }
    }
    
    
    func configureCell(_ option: [String]){
        var value = true
        optionLabel.text = option[0]
        if option[1] == "true" {
            value = true
        } else {
            value = false
        }
        switchToggle.setOn(value, animated: false)
    }
    
    
    
}
