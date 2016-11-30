//
//  Talents.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/16/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation



class Talents: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionTalents: UICollectionView!
    @IBOutlet weak var collectionBuild: UICollectionView!
    
    @IBAction func saveBuild(_ sender: AnyObject) {
        
        var alertController:UIAlertController?
        alertController = UIAlertController(title: "Enter A Name For Your Build",
                                            message: nil,
                                            preferredStyle: .alert)
        
        alertController!.addTextField(
            configurationHandler: {(textField: UITextField!) in
                textField.placeholder = "Enter a name for your Build"
        })
        
        let action = UIAlertAction(title: "Save",
                                   style: UIAlertActionStyle.default,
                                   handler: {[weak self]
                                    (paramAction:UIAlertAction!) in
                                    if let textFields = alertController?.textFields{
                                        let theTextFields = textFields as [UITextField]
                                        let enteredText = theTextFields[0].text
                                        self!.build["name"] = enteredText! as String as AnyObject?
                                        
                                        userProfile = "heroesCustom"
                                        saveToDefaults("userProfile")
                                        for hero in heroes{ if hero.hero.name == heroForDetails.hero.name {
                                            hero.builds.append(self!.build)
                                            heroForDetails = hero
                                            }}
                                        
                                        
                                        saveToDefaults(userProfile)
                                        self!.createEmptyBuild()
                                        self!.collectionBuild.reloadData()
                                        
                                    }
            })
        
        alertController?.addAction(action)
        self.present(alertController!,
                                   animated: true,
                                   completion: nil)
        
        
//        userProfile = "heroesCustom"
//        saveToDefaults("userProfile")
//        for hero in heroes{ if hero.hero.name == heroForDetails.hero.name {
//            hero.builds.append(build)
//            heroForDetails = hero
//            }}
//        
//        
//        saveToDefaults(userProfile)
//        createEmptyBuild()
//        collectionBuild.reloadData()
        
        }
    
    
    var talent: Talent!
    let levels = [1, 4, 7, 10, 13, 16, 20]
    var build = [String: AnyObject]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionTalents.delegate = self
        collectionTalents.dataSource = self
        collectionBuild.delegate = self
        collectionBuild.dataSource = self
        
        self.view.addSubview(collectionTalents)
        self.view.addSubview(collectionBuild)
        
        createEmptyBuild()
        
        
    }
    
    func createEmptyBuild(){
        
        for item in levels {
            build["\(item)"] = Talent(name: "Level \(item)", talentDescription: "Pick a Talent", cooldown: 0.0, image: "http://us.battle.net/heroes/static/images/heroes/skills/icons/kharazim_pickYourTrait.png", image_url: "")

        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    //cals when it needs a new cell
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        if collectionView == self.collectionTalents {
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TalentsCell", for: indexPath) as? TalentsCell {
                
                var level = 1
                
                switch ((indexPath as NSIndexPath).section) {
                
                case 0:
                    level = 1
                case 1:
                    level = 4
                case 2:
                    level = 7
                case 3:
                    level = 10
                case 4:
                    level = 13
                case 5:
                    level = 16
                case 6:
                    level = 20
                default:
                    level = 1


                }
                
                let talentsArray = heroForDetails.hero.talents["\(level)"]!
                
                talent = talentsArray[(indexPath as NSIndexPath).row]//heroes needs to be changed to the new array after searching
                //print("cellForItemAtIndexPath Synergy \(indexPath.row) \(hero.hero.name)")
                
                cell.configureCell(talent)
                //print("\(hero.hero.name) and \(indexPath.row)")
                return cell
                
            } else {
                return UICollectionViewCell()
            }
        } else if collectionView == self.collectionBuild {
            
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildCell", for: indexPath) as? TalentsCell {
                
                
                
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
                
            } else {
                return UICollectionViewCell()
            }
            
        
            
        }
        
        return UICollectionViewCell()


        
    }
    
    //called when you select an item
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionTalents {
            var level = 1
            
            switch ((indexPath as NSIndexPath).section) {
                
            case 0:
                level = 1
            case 1:
                level = 4
            case 2:
                level = 7
            case 3:
                level = 10
            case 4:
                level = 13
            case 5:
                level = 16
            case 6:
                level = 20
            default:
                level = 1
                
                
            }
            
            let talentsArray = heroForDetails.hero.talents["\(level)"]!
            talent = talentsArray[(indexPath as NSIndexPath).row]
            build["\(level)"] = talent
            collectionBuild.reloadData()

            
        
        } else if collectionView == self.collectionBuild {
            
        }
        
        
        
        
    }
    
    //number of items in each section
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        if collectionView == self.collectionTalents {
            print("numberOfItemsInSection")
            var level = 1
            
            switch (section) {
                
            case 0:
                level = 1
            case 1:
                level = 4
            case 2:
                level = 7
            case 3:
                level = 10
            case 4:
                level = 13
            case 5:
                level = 16
            case 6:
                level = 20
            default:
                level = 1
            }
            
            let talentsArray = heroForDetails.hero.talents["\(level)"]!
            
            
            return talentsArray.count

            
        } else if collectionView == self.collectionBuild {
            return 7
            
        }
        
        return 0
        
    }
    
    //each section can have its own data so maybe able to seperate heroes by role
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        //print("looked for number of sections")
        //lvl 1, 4, 7, 10, 13, 16, 20
        
        
        if collectionView == self.collectionTalents {
            return 7
            
        } else if collectionView == self.collectionBuild {
            return 1
        }
        
        return 0
    }
    
    //sets the size of the grid - why does this matter if we set the size of the cell?
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        if collectionView == self.collectionTalents {
            return CGSize(width: 400,height: 100)
            
        } else if collectionView == self.collectionBuild {
            return CGSize(width: 50,height: 50)
            
        }
        return CGSize(width: 65,height: 65)
    }
    
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        
        if collectionView == self.collectionTalents {
            
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "TalentsHeader", for: indexPath) as! TalentsHeader
            print("getting header titles")
            
            switch ((indexPath as NSIndexPath).section) { // consider handeling this is the header file or make seperate header files for each collection view header that might be different. would probably just need to make a function like herocell and call func configureHeader and put the switch statement in there.
                
            case 0:
                header.headerLabel.text = "Level 1 Talents"
            case 1:
                header.headerLabel.text = "Level 4 Talents"
            case 2:
                header.headerLabel.text = "Level 7 Talents"
            case 3:
                header.headerLabel.text = "Level 10 Talents"
            case 4:
                header.headerLabel.text = "Level 13 Talents"
            case 5:
                header.headerLabel.text = "Level 16 Talents"
            case 6:
                header.headerLabel.text = "Level 20 Talents"
                
            default:
                header.headerLabel.text = "Empty"
            }
            
            
            return header

            
        } else if collectionView == self.collectionBuild {
           
        }
       
        return UICollectionReusableView()
        
    }
    
  
    
}
