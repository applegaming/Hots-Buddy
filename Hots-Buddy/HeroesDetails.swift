//
//  HeroesDetails.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/15/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

var subPageMenu : CAPSPageMenu?

class HeroesDetails: UIViewController, UITabBarControllerDelegate, CAPSPageMenuDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        //trySegue()
        
        navigationItem.title = heroForDetails.hero.name
        
        // Array to keep track of controllers in page menu
        var subControllerArray : [UIViewController] = []
        
        // Create variables for all view controllers you want to put in the
        // page menu, initialize them, and add each to the controller array.
        // (Can be any UIViewController subclass)
        // Make sure the title property of all view controllers is set
        // Example:
        let storyboardName = "Main"
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle.main)
        //let viewController = storyboard.instantiateViewControllerWithIdentifier(viewControllerStoryboardId) as UIViewController!
        
        let controllerInfo = storyboard.instantiateViewController(withIdentifier: "Info") as UIViewController!
        controllerInfo?.title = "Info"
        subControllerArray.append(controllerInfo!)
        let controllerAbilities = storyboard.instantiateViewController(withIdentifier: "Abilities") as UIViewController!
        controllerAbilities?.title = "Abilities"
        subControllerArray.append(controllerAbilities!)
        let controllerTalents = storyboard.instantiateViewController(withIdentifier: "Talents") as UIViewController!
        controllerTalents?.title = "Talents"
        subControllerArray.append(controllerTalents!)
        let controllerRelationships = storyboard.instantiateViewController(withIdentifier: "Relationships") as UIViewController!
        controllerRelationships?.title = "Relationships"
        subControllerArray.append(controllerRelationships!)
        let controllerBuilds = storyboard.instantiateViewController(withIdentifier: "Builds") as UIViewController!
        controllerBuilds?.title = "Builds"
        subControllerArray.append(controllerBuilds!)
        let controllerSkins = storyboard.instantiateViewController(withIdentifier: "Skins") as UIViewController!
        controllerSkins?.title = "Skins"
        subControllerArray.append(controllerSkins!)
        let controllerHotsLogs = storyboard.instantiateViewController(withIdentifier: "HotsLogs")   as UIViewController!
        controllerHotsLogs?.title = "HotsLogs"
        subControllerArray.append(controllerHotsLogs!)
        
        let subParameters: [CAPSPageMenuOption] = [
//            .viewBackgroundColor(UIColor(red: 35/255, green: 27/255, blue: 70/255, alpha: 0.0)),
//            .scrollMenuBackgroundColor(UIColor(red: 35/255, green: 27/255, blue: 70/255, alpha: 0.5)),
//            .selectionIndicatorColor(UIColor(red: 193/255, green: 255/255, blue: 255/255, alpha: 1)),
//            .selectedMenuItemLabelColor(UIColor(red: 193/255, green: 255/255, blue: 255/255, alpha: 1)),
//            .unselectedMenuItemLabelColor(UIColor(red: 109/255, green: 95/255, blue: 180/255, alpha: 1)),
//            .bottomMenuHairlineColor(UIColor(red: 109/255, green: 95/255, blue: 180/255, alpha: 1)),
//            .menuHeight(25), //change to a % of screen views
//            .selectionIndicatorHeight(2.0),
//            .useMenuLikeSegmentedControl(false),
//            .menuItemSeparatorPercentageHeight(0.65),
//            .menuItemSeparatorColor(UIColor(red: 109/255, green: 95/255, blue: 180/255, alpha: 1)),
//            .menuItemSeparatorWidth(1),
//            .menuItemSeparatorRoundEdges(true),
//            .enableHorizontalBounce(false),
//            .menuItemWidthBasedOnTitleTextWidth(true),
//            .titleTextSizeBasedOnMenuItemWidth(false),
//            .scrollAnimationDurationOnMenuItemTap(0),
//            .enableControllerScrollViewScroll(false),
//            .menuItemFont(UIFont.systemFont(ofSize: 10.0))
        ]
        
        
        // Initialize page menu with controller array, frame, and optional parameters
        subPageMenu = CAPSPageMenu(viewControllers: subControllerArray, frame: CGRect(x: 0.0, y: 44.0, width: self.view.frame.width, height: (self.view.frame.height - 44.0)), pageMenuOptions: subParameters)
        
        // Lastly add page menu as subview of base view controller view
        // or use pageMenu controller in you view hierachy as desired
        self.view.addSubview(subPageMenu!.view)
        
        // Optional delegate
        subPageMenu!.delegate = self
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func switchBack(){
        print("trying to switch")
        dismiss(animated: true, completion: nil)

    }
    
    func trySegue(){
        
        print("try segue called")
        self.performSegue(withIdentifier: "heroesDetailsToEditRelationships", sender: self)
//        let viewController:UIViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Edit Relationships") as UIViewController
//        self.presentViewController(viewController, animated: false, completion: nil)
//        
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "heroesDetailsToEditRelationships" {// if this is the segue being loaded with this identifier
            if let detailsVC = segue.destination as? EditRelationships { // grab the view control we will go to and cast it as the hero detail class
                if let hero = sender as? Hero {//grabs the hero object
                    //                    detailsVC.hero = hero //sends it here
                    //                    detailsVC.heroes = heroes // try sending this too
                    //                    detailsVC.maps = maps2
                }
            }
        }
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
