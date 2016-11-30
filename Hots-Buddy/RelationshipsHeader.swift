//
//  RelationshipsHeader.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/16/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation



class RelationshipsHeader: UICollectionReusableView {
    
    
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var editRelationshipsButton: UIButton!
    
    @IBAction func editRelationshipsButton(_ sender: UIButton) {
        
        heroArrayToEditInt = sender.tag
//        switch (sender.tag) {
//            
//        case 0:
//            heroArrayToEditInt = heroForDetails.synergy
//        case 1:
//            heroArrayToEditInt = heroForDetails.strong
//        case 2:
//            heroArrayToEditInt = heroForDetails.weak
//        case 3:
//            heroArrayToEditInt = heroForDetails.synergy
//        default:
//            heroArrayToEditInt = heroForDetails.synergy
//        }

        

    }
}
