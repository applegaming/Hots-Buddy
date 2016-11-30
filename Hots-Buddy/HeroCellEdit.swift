//
//  HeroCellEdit.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/24/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit




class HeroCellEdit: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var heroBorder: UIImageView!
    
    
    
    
    var hero: Hero!
    
    // every view has a layer and drawing happens below the view
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 0
        
        
    }

    
//    override var selected: Bool{
//        didSet{
//            if(thumbImg.alpha == 1){
//                thumbImg.alpha = 0.35
//                nameLbl.alpha = 0.35
//                heroBorder?.alpha = 0.35
//                print("Deselected \(hero.hero.name)")
//                addHeroToEdit(hero, heroArray: &heroForDetails.synergy)
//
//                
//            } else {
//                thumbImg.alpha = 1
//                nameLbl.alpha = 1
//                heroBorder?.alpha = 1
//                print("selected \(hero.hero.name)")
//                addHeroToEdit(hero, heroArray: &heroForDetails.synergy)
//            }
//        }
//    }
    
    
    
    func configureCell(_ hero: Hero, heroArray: [Hero]) {
        self.hero = hero
        
        thumbImg.alpha = 0.35
        nameLbl.alpha = 0.35
        heroBorder?.alpha = 0.35
        
        nameLbl.text = self.hero.hero.name
        thumbImg.image = UIImage(named: "\(self.hero.hero.name)")
        heroBorder.image = UIImage(named: "Hero Border")
        
        for item in heroArray {
            if item.hero.name == hero.hero.name {
                //print("\(item.hero.name) and \(hero.hero.name)")
                thumbImg.alpha = 1
                nameLbl.alpha = 1
                heroBorder?.alpha = 1
            }
        }
        
        
        
    }
    
}
