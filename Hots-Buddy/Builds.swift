//
//  Builds.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/16/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class Builds: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, BuildsHeaderDelegate {
    
    @IBOutlet weak var collectionBuild: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        collectionBuild.delegate = self
        collectionBuild.dataSource = self
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        collectionBuild.reloadData()
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       
            if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "BuildCell", for: indexPath) as? TalentsCell {
                
                let build = heroForDetails.builds[(indexPath as NSIndexPath).section]
                
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
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return heroForDetails.builds.count
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 50,height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "BuildsHeader", for: indexPath) as! BuildsHeader
        
        header.delegate = self
        var buildDict = heroForDetails.builds[(indexPath as NSIndexPath).section]
        if buildDict["name"] as! String == "Most Popular Build" || buildDict["name"] as! String == "Hero is too New" {
            header.deleteBuildButton.isHidden = true
        } else {
            header.deleteBuildButton.isHidden = false
        }
        
        header.headerLabel.text = buildDict["name"] as? String
        header.deleteBuildButton.tag = (indexPath as NSIndexPath).section
        return header
        
    }
    
    func updateCollectionView () {
        self.collectionBuild.reloadData()
    }
    
}
