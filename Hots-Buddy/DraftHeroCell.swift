//
//  DraftHeroCell.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 11/10/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation



class DraftHeroCell: UICollectionViewCell {
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel?
    @IBOutlet weak var pickValueLabel: UILabel?
    @IBOutlet weak var pickValuePendant: UIImageView?
    @IBOutlet weak var heroBorder: UIImageView?
    
    
    
    
    var hero: Hero!
    
    // every view has a layer and drawing happens below the view
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        layer.cornerRadius = 0
        
        
    }
    
    //    override var selected: Bool{
    //        didSet{
    //            if(selected == true){
    //                selectedBorder!.hidden = false
    //            } else {
    //                selectedBorder!.hidden = true
    //            }
    //        }
    //    }
    
    //    override var highlighted:Bool{
    //        didSet{
    //            print("is this being called")
    //            if(highlighted == true){
    //                self.layer.borderWidth = 5.0
    //                self.layer.borderColor = UIColor.whiteColor().CGColor
    //            }else{
    //                self.layer.borderWidth = 0.0
    //                self.layer.borderColor = UIColor.whiteColor().CGColor
    //            }
    //        }
    //    }
    
    //    override var selected: Bool{
    //        didSet{
    //            if(thumbImg.alpha == 1){
    //                thumbImg.alpha = 0.35
    //                nameLbl.alpha = 0.35
    //                heroBorder?.alpha = 0.35
    //
    //            } else {
    //                thumbImg.alpha = 1
    //                nameLbl.alpha = 1
    //                heroBorder?.alpha = 1
    //            }
    //        }
    //    }
    
    
    
    func configureCell(_ hero: Hero, pickedHeroes: [Hero]? = nil, team1Active: Bool? = nil) {
        self.hero = hero
        
        
        
        
        
        if pickedHeroes != nil {
            thumbImg.alpha = 1.0
            heroBorder!.alpha = 1.0
            nameLbl!.alpha = 1.0
            pickValueLabel!.alpha = 1.0
            pickValuePendant!.alpha = 1.0
            for item in pickedHeroes!{
                if item.hero.name == hero.hero.name{
                    //print("changing \(hero.hero.name)")
                    thumbImg.alpha = 0.5
                    heroBorder!.alpha = 0.5
                    nameLbl!.alpha = 0.5
                    pickValueLabel!.alpha = 0.5
                    pickValuePendant!.alpha = 0.5
                    
                }
                
            }
            
        }
        
        if team1Active != nil {
            //print("tint color changing")
            if team1Active == true {
                //print("team1 clear color")
                //thumbImg.tintColor = UIColor.clearColor()
                //heroBorder!.tintColor = UIColor.clearColor()
                //nameLbl!.hidden = false
                //pickValueLabel!.tintColor = UIColor.clearColor()
                //pickValuePendant!.tintColor = UIColor.clearColor()
            } else if team1Active == false {
                //print("team 2 yellow")
                //thumbImg.tintColor = UIColor.clearColor()
                //heroBorder!.tintColor = UIColor.yellowColor()
                //nameLbl!.hidden = true
                //pickValueLabel?.tintColor = UIColor.yellowColor()
                //pickValuePendant!.tintColor = UIColor.yellowColor()
                
            }
            
            
            
        }
        
        
        let roundedPickValue = Int(round(self.hero.pickValue))
        
        switch hero.hero.name {
        case "pickYourHero":
            nameLbl?.isHidden = true
            pickValueLabel?.isHidden = true
            thumbImg.image = UIImage(named: "\(self.hero.hero.name)")
        default:
            nameLbl?.isHidden = false
            pickValueLabel?.isHidden = false
            nameLbl?.text = self.hero.hero.name
            thumbImg.image = UIImage(named: "\(self.hero.hero.name)")
            pickValueLabel?.text = String(roundedPickValue)
            
        }
        
        
        
        
        //        nameLbl?.text = self.hero.hero.name
        //        thumbImg.image = UIImage(named: "\(self.hero.hero.name)")
        //        pickValueLabel?.text = String(dummy)
        
    }
    
}
