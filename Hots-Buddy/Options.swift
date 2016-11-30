//
//  Options.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/8/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit

class Options: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionOptions: UICollectionView!
    
    var key = [String]()
    var value = [Bool]()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionOptions.delegate = self
        collectionOptions.dataSource = self
        
        loadFromDefaults("userOptions")
        
//        for (key, value) in userOptions{
//            self.key.append(key)
//            self.value.append(value)
//            print("doing stuff \(key) and \(value)")
//        }
        

        // Do any additional setup after loading the view.
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionsCell", for: indexPath) as? OptionsCell {
            
            
            
            cell.switchToggle.tag = (indexPath as NSIndexPath).row

            cell.configureCell(userOptions[(indexPath as NSIndexPath).row])
            return cell
        
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return userOptions.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "OptionsHeader", for: indexPath) as! TalentsHeader
       
        
        switch ((indexPath as NSIndexPath).section) { // consider handeling this is the header file or make seperate header files for each collection view header that might be different
            
        case 0:
            header.headerLabel.text = "Draft Options"
        case 1:
            print("option section 2")
        case 2:
            print("option section 2")
        case 3:
            print("option section 2")
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
