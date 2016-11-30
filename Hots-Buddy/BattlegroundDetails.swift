//
//  BattlegroundDetails.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/11/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class BattlegroundDetails: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionDetails: UICollectionView!
    
    var battleground: Battleground!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        collectionDetails.delegate = self
        collectionDetails.dataSource = self
        
        print(battleground.name)
        print(battleground.timers.count)
       

        // Do any additional setup after loading the view.
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let value = (indexPath as NSIndexPath).section
        switch value {
        case 0:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BattlegroundMapCell", for: indexPath) as? BattlegroundMapCell {
                cell.configureCell(battleground)
                return cell
            }
        case 1:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BattlegroundEventCell", for: indexPath) as? BattlegroundEventCell {
                cell.configureCell(battleground, event: battleground.events[(indexPath as NSIndexPath).row])
                return cell
            }
        case 2:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BattlegroundTipsCell", for: indexPath) as? BattlegroundTipsCell {
                cell.configureCell(battleground.timers[(indexPath as NSIndexPath).row])
                return cell
            }
        case 3:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BattlegroundTipsCell", for: indexPath) as? BattlegroundTipsCell {
                cell.configureCell(battleground.tips[(indexPath as NSIndexPath).row])
                return cell
            }
        case 4:
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
                cell.configureCell(battleground.synergy[(indexPath as NSIndexPath).row])
                return cell
            }
        default:
            print("Broken")
        }
        
        
        
        
        
        return UICollectionViewCell()
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        switch (section) {
        case 0:
            return 1
        case 1:
            return 3
        case 2:
            return battleground.timers.count
        case 3:
            return battleground.tips.count
        case 4:
            return battleground.synergy.count
        default:
            return 0
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 5
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        
            
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "SectionHeader", for: indexPath) as! TalentsHeader
           
            
            switch ((indexPath as NSIndexPath).section) { // consider handeling this is the header file or make seperate header files for each collection view header that might be different. would probably just need to make a function like herocell and call func configureHeader and put the switch statement in there.
                
            case 0:
                header.isHidden = true
            case 1:
                header.headerLabel.text = "Events"
            case 2:
                header.headerLabel.text = "Timers"
            case 3:
                header.headerLabel.text = "Tips"
            case 4:
                header.headerLabel.text = "Heroes with Synergy"
            default:
                header.headerLabel.text = "Empty"
            }
            
            
            return header
        
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
