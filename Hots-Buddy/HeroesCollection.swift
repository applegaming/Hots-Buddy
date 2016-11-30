//
//  ViewController.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/2/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation


class HeroesCollection: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate { //lets us use the following functions

    @IBOutlet weak var collection: UICollectionView!
    
    
    @IBOutlet weak var searchBar: UISearchBar!
//    var heroes = [Hero]()
//    var heroesOriginal = [Hero]()
//    var maps = [Hero]()
    var filteredHeroes = [Hero]()
    var inSearchMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collection.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collection.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource
        searchBar.delegate = self
        print("heroesCollection loaded")
//        tabBarController?.selectedIndex = 0

     
        
    }
    
    
    //cals when it needs a new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("called collection view")
        //grabs a cell thats not on the screen and reuse that
       
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
            
            
            
            
            let hero: Hero!
            
            if inSearchMode {
                hero = filteredHeroes[(indexPath as NSIndexPath).row]
            } else {
                hero = heroes[(indexPath as NSIndexPath).row]
            }
            
            
            cell.configureCell(hero)
            
            return cell
        }else {
            return UICollectionViewCell()
        }
    }
    
    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        
        let hero: Hero!
        
        if inSearchMode {
            hero = filteredHeroes[(indexPath as NSIndexPath).row]
        } else {
            hero = heroes[(indexPath as NSIndexPath).row]
        }
        
//        UIView.animateWithDuration(0.5, animations: {
//            HeroesCollection.alpha = 1
//            self.containerViewHeroesDetails.alpha = 0
//        })
//        let vc = self.storyboard?.instantiateViewControllerWithIdentifier("Heroes Details") as! HeroesDetails
//        self.presentViewController(vc, animated: true, completion: nil)
        //performSegueWithIdentifier("heroesCollectionToHeroesDetails", sender: hero)
        
        print(hero.hero.name)
        heroForDetails = hero
        
        performSegue(withIdentifier: "heroesCollectionToHeroesDetails", sender: nil)
        
        
        //NSNotificationCenter.defaultCenter().postNotificationName("refresh", object: nil)
        //self.dismissViewControllerAnimated(true, completion: nil)
        
        


        
    
    }
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        if inSearchMode {
            return filteredHeroes.count
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
        return CGSize(width: 65,height: 65)
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text == nil || searchBar.text == "" {
        inSearchMode = false
        } else {
            inSearchMode = true
            
            //let lower = searchBar.text!.lowercaseString
            //let caseInSensitive = searchBar.text!.caseInsensitiv
            
            //filteredHeroes = heroes.filter({ $0.name.rangeOfString(lower) != nil})
            
            filteredHeroes = heroes.filter({ $0.hero.name.range(of: searchBar.text!, options: .caseInsensitive) != nil})
            
        }
        collection.reloadData() // refreshes everything and grabs data again
        
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //print("prepare segue called")
        if segue.identifier == "heroesCollectionToHeroesDetails" {// if this is the segue being loaded with this identifier
            //print("called HeroDetailVC prepare Segue")
            if let detailsVC = segue.destination as? HeroesDetails { // grab the view control we will go to and cast it as the hero detail class
                if let hero = sender as? Hero {//grabs the hero object
//                    detailsVC.hero = hero //sends it here
//                    detailsVC.heroes = heroes // try sending this too
//                    detailsVC.maps = maps
                }
            }
        }
    }
    
    

    
    @IBAction func quickMatchButtonPressed() {
        print("button pressed")
        performSegue(withIdentifier: "QuickMatch", sender: heroes)
    }
   
    

    
    @IBAction func draftButtonPressed(_ sender: AnyObject) {
        print("button pressed")
        performSegue(withIdentifier: "StartDraft", sender: heroes)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

