//
//  Battlegrounds.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/8/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class Battlegrounds: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionBattlegrounds: UICollectionView!
    
    var selectedBattleground: Battleground?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionBattlegrounds.delegate = self
        collectionBattlegrounds.dataSource = self

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MapsCell", for: indexPath) as? MapsCell {
            
            var battleground: Battleground!
            
            battleground = battlegrounds[(indexPath as NSIndexPath).row]
            cell.configureMapsCell(battleground!)
            return cell
            
        }else {
            return UICollectionViewCell()
        }

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        selectedBattleground = battlegrounds[(indexPath as NSIndexPath).row]
        
        print(selectedBattleground!.name)
        print(selectedBattleground!.timers.count)
        
        
        
        performSegue(withIdentifier: "battlegroundsToBattlegroundDetails", sender: nil)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return battlegrounds.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        
        if segue.identifier == "battlegroundsToBattlegroundDetails" {// if this is the segue being loaded with this identifier
            if let detailsVC = segue.destination as? BattlegroundDetails { // grab the view control we will go to and cast it as the hero detail class
                print("got here")
                detailsVC.battleground = selectedBattleground
                
                
            }
        }
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
