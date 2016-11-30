//
//  EditRelationships.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/19/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation



class EditRelationships: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { //lets us use the following functions
    
    @IBOutlet weak var collection: UICollectionView!
    
    
    @IBAction func saveButton(_ sender: AnyObject) {
        //set userProfile to custom. save heroes to custom. dismiss VC.
        userProfile = "heroesCustom"
        saveToDefaults("userProfile")
        for hero in heroes{ if hero.hero.name == heroForDetails.hero.name {
            switch (heroArrayToEditInt) {
            case 0:
                hero.synergy = heroArrayToEdit
            case 1:
                hero.strong = heroArrayToEdit
            case 2:
                hero.weak = heroArrayToEdit
            case 3:
                hero.map = battlegroundArrayToEdit
            default:
                print("failed")
            }
            heroForDetails = hero // testing
            }
            
        }
        saveToDefaults(userProfile)
        dismiss(animated: false, completion: nil)

    }
   
    @IBAction func cancelButton(_ sender: AnyObject) {
        //load heroes from profile. dismiss VC
        loadFromDefaults(userProfile)
        dismiss(animated: false, completion: nil)
        
    }
    
    //var navTitle = heroForDetails.hero.name
    var heroArrayToEdit = [Hero]() //try switching to anyobject
    var battlegroundArrayToEdit = [Battleground]()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collection.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource
                //        tabBarController?.selectedIndex = 0
        
        navigationItem.title = heroForDetails.hero.name
        
    }
    
    
    //cals when it needs a new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if heroArrayToEditInt == 3 {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                
                let battleground: Battleground!
                battleground = battlegrounds[(indexPath as NSIndexPath).row]
                cell.configureEditBattlegroundCell(battleground, battlegroundArray: battlegroundArrayToEdit)
                return cell
            }else {
                return UICollectionViewCell()
            }
            
        } else {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                
                let hero: Hero!
                hero = heroes[(indexPath as NSIndexPath).row]
                cell.configureEditHeroCell(hero, heroArray: heroArrayToEdit)
                return cell
            }else {
                return UICollectionViewCell()
            }

        }
        
    }
    
    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if heroArrayToEditInt == 3 {
            let battleground: Battleground!
            battleground = battlegrounds[(indexPath as NSIndexPath).row]
            addBattlegroundToEdit(battleground, battlegroundArray: &battlegroundArrayToEdit)
            collection.reloadData()
        } else {
            let hero: Hero!
            hero = heroes[(indexPath as NSIndexPath).row]
            addHeroToEdit(hero, heroArray: &heroArrayToEdit)
            for heroItem in heroArrayToEdit{
                print(" \(heroItem.hero.name) synergizes with \(heroForDetails.hero.name) ")
            }
            collection.reloadData()
        }

        
        
        
        
//        let cell = collection.cellForItemAtIndexPath(indexPath)
//        cell!.alpha = 1
        
//        collection.reloadItemsAtIndexPaths([indexPath])
        
//        if cell!.selected == true {
//            print("selected \(hero.hero.name)")
//            //cell!.selected = false
//            cell!.alpha = 1
//            //selectedBorder!.hidden = false
//        } else {
//            cell!.selected = true
//            cell!.alpha = 1
//        }
//        
//        collection.reloadData()

        
        
        //        UIView.animateWithDuration(0.5, animations: {
        //            HeroesCollection.alpha = 1
        //            self.containerViewHeroesDetails.alpha = 0
        //        })
        //        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Heroes Details") as! HeroesDetails
        //        self.presentViewController(vc, animated: true, completion: nil)
        //performSegueWithIdentifier("heroesCollectionToHeroesDetails", sender: hero)
        
        //print(hero.hero.name)
        //collection.reloadData()
        //heroForDetails = hero
        
        //performSegueWithIdentifier("heroesCollectionToHeroesDetails", sender: nil)
        
        
        //NSNotificationCenter.defaultCenter().postNotificationName("refresh", object: nil)
        //self.dismissViewControllerAnimated(true, completion: nil)
        
        
        
        
        
        
    }
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       
        if heroArrayToEditInt == 3 {
            return battlegrounds.count
        } else {
            return heroes.count
        }

       
        
        
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        return 1
    }
    
    //sets the size of the grid - why does this matter if we set the size of the cell?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if heroArrayToEditInt == 3 {
            return CGSize(width: 170, height: 104)
        } else {
            return CGSize(width: 65,height: 65)
        }
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! RelationshipsHeader
        print("getting header titles")
        
        switch (heroArrayToEditInt) { // consider handeling this is the header file or make seperate header files for each collection view header that might be different
            
        case 0:
            header.headerLabel.text = "Editing Synergy With \(heroForDetails.hero.name)"
        case 1:
            header.headerLabel.text = "Editing Strong Against \(heroForDetails.hero.name)"
        case 2:
            header.headerLabel.text = "Editing Weak Against \(heroForDetails.hero.name)"
        case 3:
            header.headerLabel.text = "Editing Best Battlegrounds for \(heroForDetails.hero.name)"
        default:
            header.headerLabel.text = "Empty"
        }
        
        
        return header
        
    }

    
    
        
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

