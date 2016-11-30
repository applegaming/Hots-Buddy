//
//  MenuBarVC.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/14/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation

var pageMenu : CAPSPageMenu?


class MenuBarVC: UIViewController, CAPSPageMenuDelegate {
    
//    var heroes = [Hero]()
//    var heroesOriginal = [Hero]()
//    var maps = [Hero]()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //loadHeroes()
        //loadBattlegrounds()
        
//        
//        if let loadedHeroes = NSUserDefaults.standardUserDefaults().objectForKey("heroesCustom") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//            
//            print("user has customized heroes")
//            heroes = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedHeroes) as? [Hero])! // unarchive it from data to what it used to be
//            if let loadedMaps = NSUserDefaults.standardUserDefaults().objectForKey("maps") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//                
//                print("maps loaded from NSUserDefaults")
//                maps = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedMaps) as? [PremadeHero])! // unarchive it from data to what it used to be
//            }
//            
//        } else if let loadedHeroes = NSUserDefaults.standardUserDefaults().objectForKey("heroesOriginal") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//            
//            print("user is using default heroes")
//            heroes = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedHeroes) as? [Hero])! // unarchive it from data to what it used to be
//            if let loadedMaps = NSUserDefaults.standardUserDefaults().objectForKey("maps") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//                
//                print("maps loaded from NSUserDefaults")
//                maps = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedMaps) as? [PremadeHero])! // unarchive it from data to what it used to be
//            }
//
//
//        
//        } else {
//            appendHeroes()
//            heroes = heroesOriginal.clone()
//            let heroesData = NSKeyedArchiver.archivedDataWithRootObject(heroesOriginal) //convert to data
//            NSUserDefaults.standardUserDefaults().setObject(heroesData, forKey: "heroesOriginal") // required for array's / dicts
//            NSUserDefaults.standardUserDefaults().synchronize() // actual saving
//            print("created heroesOriginal and clone it to heroes")
//            
//        }
        
        
        //appendHeroes()
        heroesTest = "heroes"
        //print(heroesTest)


        // Array to keep track of controllers in page menu
        var controllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        //let viewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerStoryboardId) as UIViewController!
        
        let controllerHeroes = storyboard.instantiateViewController(withIdentifier: "Heroes") as UIViewController!
        controllerHeroes?.title = "Heroes"
        controllerArray.append(controllerHeroes!)
        let controllerStartDraft = storyboard.instantiateViewController(withIdentifier: "StartDraft") as UIViewController!
        controllerStartDraft?.title = "Draft"
        controllerArray.append(controllerStartDraft!)
        let controllerQuickMatch = storyboard.instantiateViewController(withIdentifier: "QuickMatch") as UIViewController!
        controllerQuickMatch?.title = "Quick Match"
        controllerArray.append(controllerQuickMatch!)
//        let controllerHeroesDetails = storyboard.instantiateViewControllerWithIdentifier("Heroes Details") as UIViewController!
//        controllerHeroesDetails.title = "Heroes Details"
//        controllerArray.append(controllerHeroesDetails)

        
        
        
        
        let parameters: [CAPSPageMenuOption] = [
//            .viewBackgroundColor(UIColor(red: 35/255, green: 27/255, blue: 70/255, alpha: 0.0)),
//            .scrollMenuBackgroundColor(UIColor(red: 35/255, green: 27/255, blue: 70/255, alpha: 0.5)),
//            .selectionIndicatorColor(UIColor(red: 193/255, green: 255/255, blue: 255/255, alpha: 1)),
//            .selectedMenuItemLabelColor(UIColor(red: 193/255, green: 255/255, blue: 255/255, alpha: 1)),
//            .unselectedMenuItemLabelColor(UIColor(red: 109/255, green: 95/255, blue: 180/255, alpha: 1)),
//            .bottomMenuHairlineColor(UIColor(red: 109/255, green: 95/255, blue: 180/255, alpha: 1)),
//            .menuHeight(55), //change to a % of screen views
//            .selectionIndicatorHeight(4.0),
//            .useMenuLikeSegmentedControl(false),
//            .menuItemSeparatorPercentageHeight(0.65),
//            .menuItemSeparatorColor(UIColor(red: 109/255, green: 95/255, blue: 180/255, alpha: 1)),
//            .menuItemSeparatorWidth(1),
//            .menuItemSeparatorRoundEdges(true),
//            .enableHorizontalBounce(false),
//            .menuItemWidthBasedOnTitleTextWidth(true),
//            .titleTextSizeBasedOnMenuItemWidth(false),
//            .scrollAnimationDurationOnMenuItemTap(0),
//            .enableControllerScrollViewScroll(false)
        ]
        
        
        // Initialize page menu with controller array, frame, and optional parameters
        pageMenu = CAPSPageMenu(viewControllers: controllerArray, frame: CGRect(x: 0.0, y: 0.0, width: self.view.frame.width, height: self.view.frame.height), pageMenuOptions: parameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(pageMenu!.view)
        
        // Optional delegate
        pageMenu!.delegate = self



        // Do any additional setup after loading the view.
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

    
