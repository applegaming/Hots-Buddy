//
//  OptionList.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/5/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation

class OptionList : NSObject, NSCoding { // Must inherit NSObject and implement NSCoding protocol
    
    var relationships = true

    init(relationships: Bool){
        self.relationships = relationships
        super.init()
    }
    

 
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        let relationships = aDecoder.decodeObject(forKey: "relationships") as! Bool

        self.init(relationships: relationships)
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.relationships, forKey: "relationships")

    }
    
}
