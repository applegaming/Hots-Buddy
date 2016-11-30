//
//  Info.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/29/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class Info: UIViewController, UITabBarControllerDelegate {
    @IBOutlet weak var heroNameLabel: UILabel!
    @IBOutlet weak var heroTitleLabel: UILabel!
    
    @IBOutlet weak var heroImageFrame: UIImageView!
    @IBOutlet weak var franchiseLabel: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var roleLabel: UIImageView!
   

    
    @IBOutlet weak var damageValue: UILabel!
    @IBOutlet weak var utilityValue: UILabel!
    @IBOutlet weak var survivabilityValue: UILabel!
    @IBOutlet weak var complexityValue: UILabel!

    @IBOutlet weak var hpValue: UILabel!
    @IBOutlet weak var hpRegnValue: UILabel!
    @IBOutlet weak var manaValue: UILabel!
    @IBOutlet weak var manaRegenValue: UILabel!
    
    
    @IBAction func backButton(_ sender: AnyObject) {

        HeroesDetails().switchBack()


    }
    
    var heroesCollection = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //hero
        heroNameLabel.text = heroForDetails.hero.name
        heroTitleLabel.text = heroForDetails.hero.title
//        heroImageFrame.image = UIImage(named: "\(heroForDetails.title)_frame")
        franchiseLabel.image = UIImage(named: "\(heroForDetails.hero.franchise)_Icon")
        //descriptionLabel.text = heroForDetails.hero.heroDescription
        roleLabel.image = UIImage(named: heroForDetails.hero.role)
        
        //ratings class
        damageValue.text = "Damage: \(heroForDetails.hero.ratings.damage)"
        utilityValue.text = "Utility: \(heroForDetails.hero.ratings.utility)"
        survivabilityValue.text = "Survivability: \(heroForDetails.hero.ratings.survivability)"
        complexityValue.text = "Complexity: \(heroForDetails.hero.ratings.complexity)"
        
        //Stats

        hpValue.text = " \(heroForDetails.hero.stats.health) (+ \(heroForDetails.hero.stats.healthPerLevel) Per Level)"
        hpRegnValue.text = " \(heroForDetails.hero.stats.healthRegen) (+ \(heroForDetails.hero.stats.healthRegenPerLevel) Per Level)"
        manaValue.text = " \(heroForDetails.hero.stats.mana) (+ \(heroForDetails.hero.stats.manaPerLevel) Per Level)"
        manaRegenValue.text = " \(heroForDetails.hero.stats.manaRegen) (+ \(heroForDetails.hero.stats.manaRegenPerLevel) Per Level)"
                
        

            
        
        
//        Hero Image Frame
//        Convert String to URL
        var temp = heroForDetails.hero.title.capitalized(with: Locale.current) // capitalize first letter of each word
        temp.replaceSubrange(temp.startIndex...temp.startIndex, with: String(temp[temp.startIndex]).lowercased()) // first letter to lower case
        temp = temp.replacingOccurrences(of: "_", with: "") //replace white spaces doesnt erase them
        temp = String(temp.characters.filter { !" ".characters.contains($0) }) //remove white spaces
        if heroForDetails.hero.name == "Greymane" {
            temp = "\(temp)Human"
        }
        
        heroImageFrame.image = UIImage(named: "\(temp)_frame")
        



        

        
        
        
        
        
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func switchVC(){
        print("called switch vc")
        tabBarController?.selectedIndex = 0
       
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    

}
