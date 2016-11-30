//
//  HomeMenu.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/7/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation

class HomeMenu: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBAction func heroesButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "homeMenuToHeroesCollection", sender: nil)
    }
    @IBAction func quickMatchButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "homeMenuToQuickMatch", sender: nil)
    }
    @IBAction func draftButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "homeMenuToPreDraft", sender: nil)
    }
    @IBAction func battlegroundsButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "homeMenuToBattlegrounds", sender: nil)
    }
    @IBAction func optionsButton(_ sender: AnyObject) {
        performSegue(withIdentifier: "homeMenuToOptions", sender: nil)

    }
    
    @IBOutlet weak var freeHeroesCollection: UICollectionView!
    
    @IBOutlet weak var topHeroesCollection: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //navigationController?.navigationBar.barTintColor = UIColor(red: 35/255, green: 27/255, blue: 70/255, alpha: 0.5)
        
        freeHeroesCollection.delegate = self
        freeHeroesCollection.dataSource = self
        topHeroesCollection.delegate = self
        topHeroesCollection.dataSource = self
        
        self.view.addSubview(freeHeroesCollection)
        self.view.addSubview(topHeroesCollection)
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        //loadHeroes()
        //loadBattlegrounds()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("called collection view")
        //grabs a cell thats not on the screen and reuse that
        
        switch collectionView {
        case freeHeroesCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                
                let hero: Hero!
                
                hero = freeHeroRotation[(indexPath as NSIndexPath).row]
                
                cell.configureCell(hero)
                
                return cell
            }else {
                return UICollectionViewCell()
            }
        case topHeroesCollection:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildCell", for: indexPath) as? TalentsCell {
                
                let hero = topHeroes[(indexPath as NSIndexPath).section]
                
                let build = hero.builds[0]
                
                switch ((indexPath as NSIndexPath).row) {
                    
                case 0:
                    cell.configureCell(build["1"]! as! Talent)
                case 1:
                    cell.configureCell(build["4"]! as! Talent)
                case 2:
                    cell.configureCell(build["7"]! as! Talent)
                case 3:
                    cell.configureCell(build["10"]! as! Talent)
                case 4:
                    cell.configureCell(build["13"]! as! Talent)
                case 5:
                    cell.configureCell(build["16"]! as! Talent)
                case 6:
                    cell.configureCell(build["20"]! as! Talent)
                default:
                    cell.configureCell(build["1"]! as! Talent)
                    
                }
                
                return cell
                
            }
            return UICollectionViewCell()

        default:
            return UICollectionViewCell()
        }

        
        
           }
    
    //called when you select an item
    //number of items in each section
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch collectionView {
        case freeHeroesCollection:
            return freeHeroRotation.count
        case topHeroesCollection:
            return 7
        default:
            return 1
        }  
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        switch collectionView {
        case freeHeroesCollection:
            return 1
        case topHeroesCollection:
            return 5
        default:
            return 1
        }
        
    }
    
    //sets the size of the grid - why does this matter if we set the size of the cell?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch collectionView {
        case freeHeroesCollection:
            return CGSize(width: 65,height: 65)
        case topHeroesCollection:
            return CGSize(width: 50,height: 50)
        default:
            return CGSize(width: 65,height: 65)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
       let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TalentsHeader", for: indexPath) as! TalentsHeader
        
    
        let hero = topHeroes[(indexPath as NSIndexPath).section]
        header.headerLabel.text = hero.hero.name
        
        return header
        
    }




}

