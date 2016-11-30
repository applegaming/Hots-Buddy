//
//  BattlegroundMapCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/11/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class BattlegroundMapCell: UICollectionViewCell {
    
    @IBOutlet weak var map: UIImageView!
    
    
    func configureCell(_ battleground: Battleground){
        
        map.image = UIImage(named: "\(battleground.name) Map")
    }
}
