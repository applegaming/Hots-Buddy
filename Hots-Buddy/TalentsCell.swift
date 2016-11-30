//
//  TalentsCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/26/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class TalentsCell: UICollectionViewCell {
    
    var talent: Talent!
    
    @IBOutlet weak var talentImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var talentDescription: UILabel?
    @IBOutlet weak var cooldownLabel: UILabel?
    @IBOutlet weak var prerequisiteLabel: UILabel?
    
    func configureCell(_ talent: Talent) { //maybe make this optional? or create a Empty Talent Object

        self.talent = talent
        
        var talentImageName = talent.name.lowercased()
        talentImageName = talentImageName.replacingOccurrences(of: " ", with: "-") //replace white spaces doesnt erase them
        talentImageName = talentImageName.replacingOccurrences(of: ",", with: "") //replace white spaces doesnt erase them
        talentImageName = talentImageName.replacingOccurrences(of: "'", with: "") //replace white spaces doesnt erase them
        talentImageName = talentImageName.replacingOccurrences(of: ".", with: "") //replace white spaces doesnt erase them

        
        talentDescription?.text = self.talent.talentDescription
        //talentImage.image = UIImage(named: "\(talentImageName)")
        talentImage.image = getImage(fileName: talent.name, subdirectory: "Talent Icons")
        
        nameLabel.text = self.talent.name
        
        
//        if self.talent.prerequisite != nil{
//            prerequisiteLabel?.text = self.talent.prerequisite
//            prerequisiteLabel?.isHidden = false
//        }
        
        if self.talent.cooldown != nil{
            cooldownLabel?.text = "\(self.talent.cooldown)" // ! in self.talent.cooldown! removes "optional" from being displayed
            cooldownLabel?.isHidden = false
        }
        
//        getUrlImage(urlString: talent.image) { responseData in             //Do stuff after parse
//            print("Got Talent Image")
//            self.talentImage.image = UIImage(data: responseData)
//        }
        

        
        
    }

    
    
    
}
