//
//  BattlegroundCellEdit.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/4/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class BattlegroundCellEdit: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heroBorder: UIImageView!
    
    
    
    
    var battleground: Battleground!
    
    // every view has a layer and drawing happens below the view
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 0
        
        
    }
    
    
    func configureCell(_ battleground: Battleground, battlegroundArray: [Battleground]) {
        self.battleground = battleground
        
        thumbImg.alpha = 0.35
        nameLbl.alpha = 0.35
        heroBorder?.alpha = 0.35
        
        nameLbl.text = self.battleground.name
        thumbImg.image = UIImage(named: "\(self.battleground.name)")
        heroBorder.image = UIImage(named: "Hero Border")
        
        for item in battlegroundArray {
            if item.name == battleground.name {
                thumbImg.alpha = 1
                nameLbl.alpha = 1
                heroBorder?.alpha = 1
            }
        }
    }
    
}
