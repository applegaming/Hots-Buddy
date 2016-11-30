//
//  ViewController.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/2/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation

class PreDraft: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout { //lets us use the following functions
    
    @IBOutlet weak var collectionMaps: UICollectionView!
    @IBOutlet var youButton: UIButton!
    @IBOutlet var enemyButton: UIButton!
    
//    var heroes = [Hero]()
//    var heroesOriginal = [Hero]()
//    var maps = [Hero]()

   
    
    
    var selectedMap: Battleground?
    var team1First: Bool?
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionMaps.delegate = self //the delegate for this collection is going to be this class - what does this mean?
        collectionMaps.dataSource = self //these two are needed to use the protocol's UICollectionViewDelegate and DataSource
        //collectionMaps.allowsMultipleSelection = false;
//        for map in maps{
//            print(map.name)
//        }
        
        enemyButton.setTitleColor(UIColor.white, for: UIControlState())
        enemyButton.setTitleColor(UIColor.red, for: .selected)
        youButton.setTitleColor(UIColor.white, for: UIControlState())
        youButton.setTitleColor(UIColor.red, for: .selected)
        
    }
    
    
    //cals when it needs a new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        //print("called collection view")
        //grabs a cell thats not on the screen and reuse that
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PredraftMapCell", for: indexPath) as? PredraftMapsCell {
            
            let battleground: Battleground!
            battleground = battlegrounds[(indexPath as NSIndexPath).row]
            cell.configureMapsCell(battleground)
            return cell
            
        }else {
            return UICollectionViewCell()
        }
    }
    
    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //let cell = collectionView.cellForItemAtIndexPath(indexPath) as? HeroCell
        //print("\(cell)")
        //let map = maps[indexPath.row]
        //cell!.configureCell(map)
//        cell!.layer.borderColor = UIColor.whiteColor().CGColor
//        cell!.layer.borderWidth = 5.0
        
        let selectedRows: [IndexPath] = self.collectionMaps.indexPathsForSelectedItems!
        for selectedRow: IndexPath in selectedRows {
            if ((selectedRow as NSIndexPath).section == (indexPath as NSIndexPath).section) && ((selectedRow as NSIndexPath).row != (indexPath as NSIndexPath).row) {
                self.collectionMaps.deselectItem(at: selectedRow, animated: false)
            }
        }
        
        
        
        
            
            
//        print("set highlighted cell")
//        let map = maps[indexPath.row]
//        cell!.layer.borderWidth = 5.0
//        cell!.layer.borderColor = UIColor.whiteColor().CGColor
//        cell!.configureCell(map)
        selectedMap = battlegrounds[(indexPath as NSIndexPath).row]
        print("User Selected \(selectedMap!.name)")
        //collectionView.reloadItemsAtIndexPaths([indexPath])
     
        
    }
    
    

    
//    func collectionView(collectionView: UICollectionView, didHighlightItemAtIndexPath indexPath: NSIndexPath) {
//        print("highlighted item")
//        
//        collectionView.selectItemAtIndexPath(indexPath, animated: true, scrollPosition: UICollectionViewScrollPosition.None)
//        let hero: Hero!
//        hero = battlegroundsInHero[indexPath.row]
//        if let cell = collectionView.dequeueReusableCellWithReuseIdentifier("MapCell", forIndexPath: indexPath) as? HeroCell{
//        cell.configureCell(hero)
//        }
//        selectedMap = battlegroundsInHero[indexPath.row]
//}
    
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return battlegrounds.count
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        return 1
    }
    
    //sets the size of the grid - why does this matter if we set the size of the cell?
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
//        return CGSizeMake(170, 104)
//    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
//        if segue.identifier == "preDraftToDraft3" {// if this is the segue being loaded with this identifier
//            if let detailsVC = segue.destinationViewController as? Draft3 { // grab the view control we will go to and cast it as the hero detail class
//                    detailsVC.team1First = team1First!
//                    //print(selectedMap!.name)
//                    detailsVC.battleground = selectedMap
//                    //print(detailsVC.battleground.name)
//            }
//        }
        if segue.identifier == "preDraftToDraft" {// if this is the segue being loaded with this identifier
            if let detailsVC = segue.destination as? Draft { // grab the view control we will go to and cast it as the hero detail class
                detailsVC.team1First = team1First!
                detailsVC.team1Active = team1First!
                //print(selectedMap!.name)
                detailsVC.battleground = selectedMap
                //print(detailsVC.battleground.name)
            }
        }
    }
    @IBAction func startDraft(_ sender: AnyObject) {
        if team1First != nil && selectedMap != nil {
            performSegue(withIdentifier: "preDraftToDraft", sender: nil)
        }
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func chooseTeam(_ sender: UIButton) {
        
        sender.isSelected = true
        if sender == youButton {
            enemyButton.isSelected = false
            team1First = true
            print("you was selected")
        } else if sender == enemyButton {
            youButton.isSelected = false
            team1First = false
            print("Enemey was selected")
        }
        
        
        
    }
    
    
}

