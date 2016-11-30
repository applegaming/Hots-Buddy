//
//  QuickMatch.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/7/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class QuickMatch: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate { //lets us use the following functions
    
    @IBOutlet weak var collectionHeroes: UICollectionView!
    @IBOutlet weak var collectionPickedHeroes: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    //var heroes: [Hero]!
    var filteredHeroes = [Hero]()
    var inSearchMode = false
    var pickedHeroes = [Hero]()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionHeroes.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collectionHeroes.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource
        collectionPickedHeroes.delegate = self
        collectionPickedHeroes.dataSource = self
        
        
        searchBar.delegate = self
        
        self.view.addSubview(collectionHeroes)
        self.view.addSubview(collectionPickedHeroes)


        // Do any additional setup after loading the view.
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("called collection view")
        //grabs a cell thats not on the screen and reuse that
        if collectionView == self.collectionHeroes {
            //print("If collection heroes")
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                //print("deque collection Heroes")
                let hero: Hero!
                
                if inSearchMode {
                    hero = filteredHeroes[(indexPath as NSIndexPath).row]
                } else {
                    hero = heroes[(indexPath as NSIndexPath).row]
                }
                cell.configureCell(hero)
                return cell
            } else {
                return UICollectionViewCell()
            }

        }
        if collectionView == self.collectionPickedHeroes {
            //print("if collection picked heroes")
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PickedHeroCell", for: indexPath) as? HeroCell {
                //print("dequeue picked heroes")
                
                let hero: Hero!
                hero = pickedHeroes[(indexPath as NSIndexPath).row]
                cell.configureCell(hero)
                return cell
                
            }
        } else {
            //print("goes into else")
            return UICollectionViewCell()
        }
        //print("about to return UICollectionView Cell")
        return UICollectionViewCell()
       
    }


    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //print("did select something")
        if collectionView == self.collectionHeroes && pickedHeroes.count <= 4 {
            let hero: Hero!
            
            if inSearchMode {
                hero = filteredHeroes[(indexPath as NSIndexPath).row]
                findSynergy(heroes, heroToFilter: hero.synergy, increment: 1)
                filteredHeroes.remove(at: (indexPath as NSIndexPath).row)
                heroes.remove(at: (indexPath as NSIndexPath).row)
                filteredHeroes = filteredHeroes.sorted(by: { $0.pickValue > $1.pickValue }) // sort function
            } else {
                hero = heroes[(indexPath as NSIndexPath).row]
                findSynergy(heroes, heroToFilter: hero.synergy, increment: 1)
                heroes.remove(at: (indexPath as NSIndexPath).row)
                heroes =  heroes.sorted(by: { $0.pickValue > $1.pickValue }) // sort function
            }
            pickedHeroes.append(hero)
            
            
            collectionHeroes.reloadData() // refreshes everything and grabs data again
            collectionPickedHeroes.reloadData()
        } else if collectionView == self.collectionPickedHeroes {
            let hero: Hero!
            hero = pickedHeroes[(indexPath as NSIndexPath).row]
            pickedHeroes.remove(at: (indexPath as NSIndexPath).row)
            heroes.append(hero)
            findSynergy(heroes, heroToFilter: hero.synergy, increment: -1)
            heroes = heroes.sorted(by: { $0.pickValue > $1.pickValue }) // sort function
            
            
            collectionHeroes.reloadData() // refreshes everything and grabs data again
            collectionPickedHeroes.reloadData()
            
            
            
        }
        
        
    }
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionHeroes {
            if inSearchMode {
                return filteredHeroes.count
            } else {
                return heroes.count
            }
        } else if collectionView == self.collectionPickedHeroes {
            return pickedHeroes.count
        }
       return 0
        
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
        collectionHeroes.reloadData() // refreshes everything and grabs data again
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}

