//
//  Abilities.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/11/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class Abilities: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    
    @IBOutlet weak var collection: UICollectionView!
 
//    let abilitiesArray: [Ability] = { () -> ([Ability]) in
//        let val = heroForDetails.hero.abilities
//        for (heroId, abilities) in val {
//            if heroForDetails.hero.id == heroId {
//                return abilities
//            }
//        }
//    }()

    var abilitiesArray = heroForDetails.hero.abilities
    var heroicAbilities = [Ability]()
    var traitAbilities = [Ability]()
    var mountAbilities = [Ability]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collection.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collection.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource
//        print(abilitiesArray.count)
//        let ability = abilitiesArray[1]
//        print(ability.name)
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        let screenWidth = screenSize.width * 0.85
//        let screenHeight = screenSize.height * 0.85
//        print("height \(screenHeight)")
//        print("width \(screenWidth)")
//        
//        for item in abilitiesArray {
//            print(item.mount)
//            if item.heroic == true {
//                heroicAbilities.append(item)
//                let index = abilitiesArray.index(of: item)
//                abilitiesArray.remove(at: index!)
//            }
//        }
//        for item in abilitiesArray {
//            if item.trait == true {
//                traitAbilities.append(item)
//                let index = abilitiesArray.index(of: item)
//                abilitiesArray.remove(at: index!)
//            }
//        }
//        
//        for item in abilitiesArray {
//            if item.mount == true {
//                mountAbilities.append(item)
//                let index = abilitiesArray.index(of: item)
//                abilitiesArray.remove(at: index!)
//            }
//        }
     


        
        
        

        // Do any additional setup after loading the view.
    }
    
    
    //cals when it needs a new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "AbilitiesCell", for: indexPath) as? AbilitiesCell {
            
            let ability: Ability
            //let abiliesArray = heroForDetails.hero.abilities[heroForDetails.hero.id]!
            switch ((indexPath as NSIndexPath).section) {
                
            case 0:
                ability = abilitiesArray[(indexPath as NSIndexPath).row]
            case 1:
                ability = heroicAbilities[(indexPath as NSIndexPath).row]
            case 2:
                ability = traitAbilities[(indexPath as NSIndexPath).row]
            case 3:
                ability = mountAbilities[(indexPath as NSIndexPath).row]
            default:
                ability = abilitiesArray[(indexPath as NSIndexPath).row]
            }

            
            cell.configureAbilityCell(ability)
            print(ability)
            return cell
            
        }else {
            return UICollectionViewCell()
        }
    }
    
    //called when you select an item
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
 
    }
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
//        let val = heroForDetails.hero.abilities
//        for (heroId, abilities) in val {
//            if heroForDetails.hero.id == heroId {
//                return abilities.count
//            }
//        }
        switch (section) {
            
        case 0:
            return abilitiesArray.count
        case 1:
            return heroicAbilities.count
        case 2:
            return traitAbilities.count
        case 3:
            return mountAbilities.count
        default:
            return 0
        }
        
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        var count = 0
        if abilitiesArray.count >= 1 { count = count + 1}
        if heroicAbilities.count >= 1 { count = count + 1}
        if traitAbilities.count >= 1 { count = count + 1}
        if mountAbilities.count >= 1 { count = count + 1}
        
        return count
    }
    
//    //sets the size of the grid - why does this matter if we set the size of the cell?
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        let screenSize: CGRect = UIScreen.mainScreen().bounds
//        let screenWidth = screenSize.width
//        let screenHeight = screenSize.height * 0.2
//        
//        return CGSizeMake(screenWidth, screenHeight)
//    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "AbilitiesHeader", for: indexPath) as! TalentsHeader
        
        switch ((indexPath as NSIndexPath).section) { // consider handeling this is the header file or make seperate header files for each collection view header that might be different
            
        case 0:
            header.headerLabel.text = "Abilities"
        case 1:
            header.headerLabel.text = "Heroic Abilities"
        case 2:
            header.headerLabel.text = "Trait"
        case 3:
            header.headerLabel.text = "Mount Ability"
        default:
            header.headerLabel.text = "Empty"
        }
        return header
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
