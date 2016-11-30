//
//  PostDraft.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/8/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class PostDraft: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "draftToPostDraft" {// if this is the segue being loaded with this identifier
            if let detailsVC = segue.destination as? PostDraft { // grab the view control we will go to and cast it as the hero detail class
//                detailsVC.team1First = team1First!
//                detailsVC.map = selectedMap
            }
        }
    }


}
