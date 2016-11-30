//
//  AbilitiesCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/11/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation
import UIKit

class AbilitiesCell: UICollectionViewCell {
    
    
    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var shortcut: UILabel!
    @IBOutlet weak var cost: UILabel!
    @IBOutlet weak var cooldown: UILabel!
    @IBOutlet weak var abilityDescription: UILabel!
    
        
    
    
    var ability: Ability!
    
    // every view has a layer and drawing happens below the view
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 0
        
        
    }
    
    func configureAbilityCell(_ ability: Ability) {
        self.ability = ability
        
        
        //consider putting this into a global function becuase talents uses it too
        var abilityImageName = ability.name.lowercased()
        abilityImageName = abilityImageName.replacingOccurrences(of: " ", with: "-") //replace white spaces doesnt erase them
        abilityImageName = abilityImageName.replacingOccurrences(of: ",", with: "") //replace white spaces doesnt erase them
        abilityImageName = abilityImageName.replacingOccurrences(of: "'", with: "") //replace white spaces doesnt erase them
        //image.image = UIImage(named: "\(abilityImageName)")
        image.image = getImage(fileName: ability.name, subdirectory: "Ability Icons")
        
        name.text = ability.name
        shortcut.text = ability.shortcut
        if ability.manaCost != nil {
            cost.isHidden = false
            cost.text = "Cost: \(ability.manaCost)"
        } else {
            cost.isHidden = true
        }
        if ability.cooldown != nil {
            cooldown.isHidden = false
            cooldown.text = "Cooldown: \(ability.cooldown)"
        } else {
            cooldown.isHidden = true
        }
        
        
        abilityDescription.text = ability.abilityDescription
        
//        getUrlImage(urlString: ability.image) { responseData in             //Do stuff after parse
//            print("Got Ability Image")
//            self.image.image = UIImage(data: responseData)
//            
//        }

        
    }
    
        
}

