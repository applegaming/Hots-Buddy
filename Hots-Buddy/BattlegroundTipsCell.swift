//
//  BattlegroundTipsCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/11/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class BattlegroundTipsCell: UICollectionViewCell {
    
    @IBOutlet weak var tip: UILabel!
    
    func configureCell(_ tip: String){
        self.tip.text = tip
    }
}
