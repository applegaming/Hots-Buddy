//
//  MapsCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/15/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class MapsCell: UICollectionViewCell {
    
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!

    @IBOutlet weak var selectedBorder: UIImageView?
    
    var battleground: Battleground!
    
    // every view has a layer and drawing happens below the view
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 0
        
        
    }
    
//    override var selected: Bool{ // must change this to accomodate the use of mapcell in relationships
//        didSet{
//            if(selected == true){
//                //selectedBorder!.image = UIImage(named: "Highlighted Hero Border")
//                thumbImg.alpha = 1
//                //selectedBorder!.hidden = false
//            } else {
//                //selectedBorder!.image = UIImage(named: "Hero Border")
//                thumbImg.alpha = 0.50
//                //selectedBorder!.hidden = true
//            }
//        }
//    }
    
    func configureMapsCell(_ battleground: Battleground) {
        self.battleground = battleground
        
        nameLbl.text = self.battleground.name
        thumbImg.image = UIImage(named: "\(self.battleground.name)")
        
    }


}

