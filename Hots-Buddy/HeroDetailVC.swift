//
//  HeroDetailVC.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/3/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation



class HeroDetailVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout, UISearchBarDelegate { //lets us use the following functions
    
    @IBOutlet weak var collectionSynergy: UICollectionView!
    @IBOutlet weak var collectionStrong: UICollectionView!
    @IBOutlet weak var collectionWeak: UICollectionView!
    @IBOutlet weak var collectionMap: UICollectionView!
    
    
    var hero: Hero! //! signals that it will ABSOLUTELY have a value
    var heroes: [Hero]! //! signals that it will ABSOLUTELY have a value
    var maps: [Hero]!
    
    
  
    
    
    @IBOutlet weak var nameLbl: UILabel!
    var heroesInSynergy = [Hero]()
    var heroesInStrong  = [Hero]()
    var heroesInWeak = [Hero]()
    var mapsInHero = [Hero]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionSynergy.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collectionSynergy.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource
        collectionStrong.delegate = self
        collectionStrong.dataSource = self
        collectionWeak.delegate = self
        collectionWeak.dataSource = self
        collectionMap.delegate = self
        collectionMap.dataSource = self
        
        self.view.addSubview(collectionSynergy)
        self.view.addSubview(collectionStrong)
        self.view.addSubview(collectionWeak)
        self.view.addSubview(collectionMap)
        
        nameLbl.text = hero.hero.name
        
        fillHeroesIntoArray(hero)
        
        let heroesData = NSKeyedArchiver.archivedData(withRootObject: heroes) //convert to data
        UserDefaults.standard.set(heroesData, forKey: "heroesCustom") // required for array's / dicts
        UserDefaults.standard.synchronize() // actual saving
        
       


        
       
    }
    
    func fillHeroesIntoArray(_ heroToSearch: Hero){
        
        print("filled Heroes into Array")
        
        heroesInSynergy = [Hero]()
        heroesInStrong = [Hero]()
        heroesInWeak = [Hero]()
        mapsInHero = [Hero]()
        
        
        
//            for hero in heroes{
//                for item in heroToSearch.synergy{
//                    if hero.hero.name == item {
//                        heroesInSynergy.append(hero)
//                    }
//                }
//        }
//            for hero in heroes{
//                for item in heroToSearch.strong{
//                    if hero.hero.name == item {
//                        heroesInStrong.append(hero)
//                    }
//                }
//            }
//            for hero in heroes{
//                for item in heroToSearch.weak{
//                    if hero.hero.name == item {
//                        heroesInWeak.append(hero)
//                    }
//                }
//        }
//            for map in maps{
//                for item in heroToSearch.map{
//                    if map.hero.name == item {
//                        mapsInHero.append(map)
//                    }
//                }
//        }
//        for hero in mapsInHero {
//            print(hero.hero.name)
//        }
//       
    
    
        
//        print("filled Heroes into Array")
//        
//        heroesInSynergy = [Hero]()
//        heroesInStrong = [Hero]()
//        heroesInWeak = [Hero]()
//        mapsInHero = [Hero]()
//        
//        
//        
//        if valueToSearch == "synergy"{
//            for hero in heroes{
//                for item in heroToSearch.synergy{
//                    if hero.name == item {
//                        heroesInSynergy.append(hero)
//                    }
//                }
//            }
//        }else if valueToSearch == "strong"{
//            for hero in heroes{
//                for item in heroToSearch.strong{
//                    if hero.name == item {
//                        heroesInStrong.append(hero)
//                    }
//                }
//            }
//        }else if valueToSearch == "weak"{
//            for hero in heroes{
//                for item in heroToSearch.weak{
//                    if hero.name == item {
//                        heroesInWeak.append(hero)
//                    }
//                }
//            }
//        }else if valueToSearch == "map"{
//            for hero in heroes{
//                for item in heroToSearch.map{
//                    if hero.name == item {
//                        mapsInHero.append(hero)
//                    }
//                }
//            }
//        }else {
//            print("add variable of look for typo")
//        }
//        return heroesInSynergy
//        return heroesInStrong
//        return heroesInWeak
//        return mapsInHero
        
        
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        //print("collection view called")
        if collectionView == self.collectionSynergy {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SynergyCell", for: indexPath) as? HeroCell {
                //let hero: Hero!
                //print("Synergy Cell Called")
                hero = heroesInSynergy[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                cell.configureCell(hero)
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else if collectionView == self.collectionStrong {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StrongCell", for: indexPath) as? HeroCell {
                //let hero: Hero!
                //print("Strong Cell Called")
                hero = heroesInStrong[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                cell.configureCell(hero)
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else if collectionView == self.collectionWeak {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WeakCell", for: indexPath) as? HeroCell {
                //let hero: Hero!
                //print("Weak Cell Called")
                hero = heroesInWeak[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                cell.configureCell(hero)
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else if collectionView == self.collectionMap {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapCell", for: indexPath) as? HeroCell {
                //let hero: Hero!
                //print("Map Cell Called")
                hero = mapsInHero[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                cell.configureCell(hero)
                return cell
            }else{
                return UICollectionViewCell()
            }
        }else{
            return UICollectionViewCell()
        }

        
        
    }
    
    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        print("selected an item")
//        print("The number of items in the array is \(heroesInArray.count)")
//        for hero in heroesInArray{
//            print("\(hero.name) is in the array")
//        }
//        print("the hero selected is \(heroesInArray[indexPath.row])")
        
//        let hero: Hero!
//        hero = heroesInArray[indexPath.row] //heroes needs to be changed to the new array after searching
//        print("attempting to performSegueWithIdentifier")
//        performSegueWithIdentifier("HeroDetailVC", sender: hero) //wonder if it can call itself?
        
//        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("heroDetailVC") as UIViewController
//        self.presentViewController(viewController, animated: false, completion: nil)
        
//        let doesntMatter = self.storyboard?.instantiateViewControllerWithIdentifier("heroDetailVC") as! HeroDetailVC
//        print("1")
//        if collectionView == self.collectionSynergy {
//            doesntMatter.hero = heroesInSynergy[indexPath.row]
//            print("returned map \(heroesInSynergy)")
//        } else if collectionView == self.collectionStrong {
//            doesntMatter.hero = heroesInStrong[indexPath.row]
//            print("returned map \(heroesInStrong)")
//        } else if collectionView == self.collectionWeak {
//            doesntMatter.hero = heroesInWeak[indexPath.row]
//            print("returned map \(heroesInWeak)")
//        } else if collectionView == self.collectionMap {
//            doesntMatter.hero = mapsInHero[indexPath.row]
//            print("returned map \(mapsInHero)")
//        }
//        //doesntMatter.hero = heroesInSynergy[indexPath.row]
//        print("2")
//        doesntMatter.heroes = heroes
//        doesntMatter.maps = maps
//        print("3")
//        self.presentViewController(doesntMatter, animated: true, completion: nil)
//        print("4")
        

        
                if collectionView == self.collectionSynergy {
                    hero = heroesInSynergy[(indexPath as NSIndexPath).row]
                    nameLbl.text = hero.hero.name
                    print("returned map \(heroesInSynergy)")
                } else if collectionView == self.collectionStrong {
                    hero = heroesInStrong[(indexPath as NSIndexPath).row]
                    nameLbl.text = hero.hero.name
                    print("returned map \(heroesInStrong)")
                } else if collectionView == self.collectionWeak {
                    hero = heroesInWeak[(indexPath as NSIndexPath).row]
                    nameLbl.text = hero.hero.name
                    print("returned map \(heroesInWeak)")
                } else if collectionView == self.collectionMap {
                    hero = mapsInHero[(indexPath as NSIndexPath).row]
                    nameLbl.text = hero.hero.name
                    print("returned map \(mapsInHero)")
                }
        
                fillHeroesIntoArray(hero)
                collectionSynergy.reloadData()
                collectionStrong.reloadData()
                collectionWeak.reloadData()
                collectionMap.reloadData()
        
}
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //print("looked for number of items")
        
        if collectionView == self.collectionSynergy {
            return heroesInSynergy.count
        } else if collectionView == self.collectionStrong {
            return heroesInStrong.count
        } else if collectionView == self.collectionWeak {
            return heroesInWeak.count
        } else if collectionView == self.collectionMap {
            return mapsInHero.count
        } else {
            return 0
        }
        
//        
//        
//        if collectionView == self.collectionSynergy {
//            fillHeroesIntoArray(hero, valueToSearch: "synergy")
//            return heroesInArray.count
//        } else if collectionView == self.collectionStrong {
//            fillHeroesIntoArray(hero, valueToSearch: "strong")
//            return heroesInArray.count
//        } else if collectionView == self.collectionWeak {
//            fillHeroesIntoArray(hero, valueToSearch: "weak")
//            return heroesInArray.count
//        } else if collectionView == self.collectionMap {
//            fillHeroesIntoArray(hero, valueToSearch: "map")
//            return heroesInArray.count
//        } else {
//            return heroesInArray.count
//        }
        
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        return 1
    }
    
    //sets the size of the grid - why does this matter if we set the size of the cell?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        //print("tried to determine size")
        return CGSize(width: 75,height: 75)
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        print("segue being prepared for")
        
            if let detailsVC = segue.destination as? HeroDetailVC { // grab the view control we will go to and cast it as the hero detail class
                print("\(detailsVC)")
                print("segue.destinationViewController Successful")
                if let hero = sender as? Hero {//grabs the hero object
                    print("hero= sender as? successful")
                    detailsVC.hero = hero //sends it here
                    print("hero = \(detailsVC.hero)")
                    detailsVC.heroes = heroes
                    detailsVC.maps = maps
                }
                
            }
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func backButtonPressed(_ sender: AnyObject) {
        dismiss(animated: true, completion: nil)
    }
    

}

