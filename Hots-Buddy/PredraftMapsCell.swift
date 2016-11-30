//
//  PredraftMapsCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/4/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class PredraftMapsCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    @IBOutlet weak var selectedBorder: UIImageView?
    
    var battleground: Battleground!
    
    // every view has a layer and drawing happens below the view
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 0
        
        
    }
    
    override var isSelected: Bool{ // must change this to accomodate the use of mapcell in relationships
        didSet{
            if(isSelected == true){
                //selectedBorder!.image = UIImage(named: "Highlighted Hero Border")
                thumbImg.alpha = 1
                nameLbl.alpha = 1
                selectedBorder!.alpha = 1
                //selectedBorder!.hidden = false
            } else {
                //selectedBorder!.image = UIImage(named: "Hero Border")
                thumbImg.alpha = 0.50
                nameLbl.alpha = 0.75
                selectedBorder!.alpha = 0.25
                //selectedBorder!.hidden = true
            }
        }
    }
    
    func configureMapsCell(_ battleground: Battleground) {
        self.battleground = battleground
        
        nameLbl.text = self.battleground.name
        thumbImg.image = UIImage(named: "\(self.battleground.name)")
        
    }
    

    
}
