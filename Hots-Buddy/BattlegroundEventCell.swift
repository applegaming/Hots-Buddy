//
//  BattlegroundEventCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/11/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class BattlegroundEventCell: UICollectionViewCell {
    
    @IBOutlet weak var eventImage: UIImageView!
    @IBOutlet weak var eventTitle: UILabel!
    @IBOutlet weak var eventDescription: UILabel!
    
    
    
    
    func configureCell(_ battleground: Battleground, event: [String]){
        
        eventImage.image = UIImage(named: "\(event[0])")
        eventTitle.text = "\(event[1])"
        eventDescription.text = "\(event[2])"
        
    }
}
