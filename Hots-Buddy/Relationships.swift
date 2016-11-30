//
//  Relationships.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/16/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation

class Relationships: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collection: UICollectionView!

    var hero: Hero!
    var battleground: Battleground?
    var heroesInSynergy = [Hero]()
    var heroesInStrong  = [Hero]()
    var heroesInWeak = [Hero]()
    var battlegroundsInHero = [Battleground]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        


        //fillHeroesIntoArray(heroForDetails)

        collection.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collection.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource

        // Do any additional setup after loading the view.
        
        print("The parent view controller is \(parent?.title)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collection.reloadData()
        
        print("tried to reload after dismiss")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//    func fillHeroesIntoArray(heroToSearch: Hero){
//        
//        print("filled Heroes into Array")
//        
//        heroesInSynergy = [Hero]()
//        heroesInStrong = [Hero]()
//        heroesInWeak = [Hero]()
//        battlegroundsInHero = [Battleground]()
//        
//        
//        
//        for hero in heroes{
//            for item in heroToSearch.synergy{
//                if hero.hero.name == item {
//                    heroesInSynergy.append(hero)
//                }
//            }
//        }
//        for hero in heroes{
//            for item in heroToSearch.strong{
//                if hero.hero.name == item {
//                    heroesInStrong.append(hero)
//                }
//            }
//        }
//        for hero in heroes{
//            for item in heroToSearch.weak{
//                if hero.hero.name == item {
//                    heroesInWeak.append(hero)
//                }
//            }
//        }
//        for map in battlegrounds{
//            for item in heroToSearch.map{
//                if map.name == item {
//                    battlegroundsInHero.append(map)
//                }
//            }
//        }
//    }

    
    //cals when it needs a new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
            
            switch ((indexPath as NSIndexPath).section) {
            case 0:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                    hero = heroForDetails.synergy[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                    print("cellForItemAtIndexPath Synergy \((indexPath as NSIndexPath).row) \(hero.hero.name)")
                    
                    cell.configureCell(hero)
                    //print("\(hero.hero.name) and \(indexPath.row)")
                    return cell
                }
                
            case 1:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                    print("cellForItemAtIndexPath Strong")
                    hero = heroForDetails.strong[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                    cell.configureCell(hero)
                    return cell
                }
                
            case 2:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                    print("cellForItemAtIndexPath Weak")
                    hero = heroForDetails.weak[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                    cell.configureCell(hero)
                    return cell
                }
                
            case 3:
                if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapsCell", for: indexPath) as? MapsCell {
                    print("cellForItemAtIndexPath Map")
                    battleground = heroForDetails.map[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                    cell.configureMapsCell(battleground!) // need to configure this to mapscell but there is no cell to use because they have the identifier of herocell.
                    return cell
                }
                
            default:
                return UICollectionViewCell()
            }
        
        return UICollectionViewCell()

    }
    
    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        //let hero: PremadeHero!
//        print("didSelectItemAtIndexPath")
//
//      
//        switch (indexPath.section) {
//        
//        case 0:
//            heroForDetails = heroForDetails.synergy[indexPath.row]
//        case 1:
//            heroForDetails = heroForDetails.strong[indexPath.row]
//        case 2:
//            heroForDetails = heroForDetails.weak[indexPath.row]
//        case 3:
//            battleground = heroForDetails.map[indexPath.row]
//        default:
//            heroForDetails = heroForDetails.synergy[indexPath.row]
//        }
//
//        
//        //heroForDetails = hero
//        print("didselect \(heroForDetails.hero.name)")
//        //fillHeroesIntoArray(heroForDetails)
//        collectionView.reloadData()
        
        
    }
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print("numberOfItemsInSection")
        switch (section) {
        
        case 0:
            print("Synergy Count \(heroForDetails.synergy.count)")
            return heroForDetails.synergy.count
        case 1:
            print("Strong Count \(heroForDetails.strong.count)")
            return heroForDetails.strong.count
        case 2:
            print("Weak Count \(heroForDetails.weak.count)")
            return heroForDetails.weak.count
        case 3:
            print("Map Count \(heroForDetails.map.count)")
            return heroForDetails.map.count
        default:
            return 0
        }
        
        
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        return 4
    }
    
    //sets the size of the grid - why does this matter if we set the size of the cell?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 65,height: 65)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! RelationshipsHeader
        print("getting header titles")
        
        switch ((indexPath as NSIndexPath).section) { // consider handeling this is the header file or make seperate header files for each collection view header that might be different
        
        case 0:
            header.headerLabel.text = "Synergy With"
        case 1:
            header.headerLabel.text = "Strong Against"
        case 2:
            header.headerLabel.text = "Weak Against"
        case 3:
            header.headerLabel.text = "Best Battlegrounds"
        default:
            header.headerLabel.text = "Empty"
        }
        
        header.editRelationshipsButton.tag = (indexPath as NSIndexPath).section

        return header
        
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "relationshipsToEditRelationships" {// if this is the segue being loaded with this identifier
            let navController = segue.destination as! UINavigationController //needed for VC's embedded in nav controllers
            let detailsVC = navController.topViewController as! EditRelationships  // grab the view control we will go to and cast it as the hero detail class
            
            //detailsVC.navTitle = "Editing Synergy for \(heroForDetails.hero.name)" //sends it here
            
            switch (heroArrayToEditInt) {
            case 0:
                detailsVC.heroArrayToEdit = heroForDetails.synergy
            case 1:
                detailsVC.heroArrayToEdit = heroForDetails.strong
            case 2:
                detailsVC.heroArrayToEdit = heroForDetails.weak
            case 3:
                detailsVC.battlegroundArrayToEdit = heroForDetails.map
            default:
                print("failed at prepare for segue")
            }
            //detailsVC.heroArrayToEdit = heroForDetails.synergy // try sending this too
                          
                
            
        }
    }

    
    
    

   
}
