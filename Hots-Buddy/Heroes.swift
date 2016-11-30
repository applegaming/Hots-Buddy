//
//  Heroes.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/27/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//
import Foundation
import UIKit



class Heroes: UIViewController, UITabBarControllerDelegate {
    
    @IBOutlet weak var containerViewHeroesCollection: UIView!
    @IBOutlet weak var containerViewHeroesDetails: UIView!
    
    


    override func viewDidLoad() {
        super.viewDidLoad()

        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: "refreshList:", name:"refresh", object: nil)

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
        
        // Dispose of any resources that can be recreated.
    }
    

    func refreshList(_ notification: Notification){ //called from collection view 
        
        //switchAlpha()
       
        
        
    }
    
        
    
    
    func switchAlpha() {
        if containerViewHeroesCollection?.alpha == 1 {

            UIView.animate(withDuration: 0.5, animations: {
                self.containerViewHeroesCollection.alpha = 0
                self.containerViewHeroesDetails.alpha = 1
            })
        } else {

            UIView.animate(withDuration: 0.5, animations: {
                self.containerViewHeroesCollection.alpha = 1
                self.containerViewHeroesDetails.alpha = 0
            })
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





