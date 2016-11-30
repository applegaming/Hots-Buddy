//
//  BuildsHeader.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/3/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

protocol BuildsHeaderDelegate {
    func updateCollectionView()
}

class BuildsHeader: UICollectionReusableView {
    
    var delegate: BuildsHeaderDelegate?
    
    @IBOutlet weak var headerLabel: UILabel!
    
    @IBOutlet weak var deleteBuildButton: UIButton!
    
    @IBAction func deleteBuildButton(_ sender: UIButton) {
        
        for hero in heroes{ if hero.hero.name == heroForDetails.hero.name {
            hero.builds.remove(at: sender.tag)
            heroForDetails = hero
            }}
        
        saveToDefaults(userProfile)
        self.delegate?.updateCollectionView()
       //Builds().collectionBuild.reloadData() runs just fine without this line
    }
}
