//
//  Hero.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/2/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation
import UIKit

//Protocal that copyable class should conform
protocol Copying {
    init(original: Self)
}

//Concrete class extension
extension Copying {
    func copy() -> Self {
        return Self.init(original: self)
    }
}

//Array extension for elements conforms the Copying protocol
extension Array where Element: Copying {
    func clone() -> Array {
        var copiedArray = Array<Element>()
        for element in self {
            copiedArray.append(element.copy())
        }
        print("cloned Heroes Array")
        return copiedArray
    }
}


class Hero: NSObject, NSCoding, Copying {
    //var hero: JsonHero
    var hero: HeroData
    var synergy = [Hero]()
    var strong = [Hero]()
    var weak = [Hero]()
    var map = [Battleground]()
    var tags = [""]
    var pickValue = 0.0
    var pickValueHistory = [Double]()
    var builds = [[String: AnyObject]]()// when adding a new property to heroes add to init, required init, both NSUSERDegaults,
    var owned = false
    var favorite = false
    var inFreeHeroRotation = false
    
    

    
//    init(hero: JsonHero, synergy: [Hero], strong: [Hero], weak: [Hero], map: [Battleground], tags: [String], pickValue: Double, pickValueHistory: [Double], builds: [[String: AnyObject]], owned: Bool, favorite: Bool, inFreeHeroRotation: Bool) {
//        self.hero = hero
//        self.synergy = synergy
//        self.strong = strong
//        self.weak = weak
//        self.map = map
//        self.tags = tags
//        self.pickValue = pickValue
//        self.pickValueHistory = pickValueHistory
//        self.builds = builds
//        self.owned = owned
//        self.favorite = favorite
//        self.inFreeHeroRotation = inFreeHeroRotation
//        super.init()
//    }
    
    init(hero: HeroData, synergy: [Hero], strong: [Hero], weak: [Hero], map: [Battleground], tags: [String], pickValue: Double, pickValueHistory: [Double], builds: [[String: AnyObject]], owned: Bool, favorite: Bool, inFreeHeroRotation: Bool) {
        self.hero = hero
        self.synergy = synergy
        self.strong = strong
        self.weak = weak
        self.map = map
        self.tags = tags
        self.pickValue = pickValue
        self.pickValueHistory = pickValueHistory
        self.builds = builds
        self.owned = owned
        self.favorite = favorite
        self.inFreeHeroRotation = inFreeHeroRotation
        super.init()
    }

    
//    convenience init(hero: JsonHero) {
//        //self.hero = hero
//        
//        init(hero: hero, synergy: synergy, strong: strong, weak: weak, map: map, tags: tags, pickValue: pickValue)
//
//        
//    }
    
    
    
    
    required init(original: Hero) {
        
        hero = original.hero
        synergy = original.synergy
        strong = original.strong
        weak = original.weak
        map = original.map
        tags = original.tags
        pickValue = original.pickValue
        pickValueHistory = original.pickValueHistory
        builds = original.builds
        owned = original.owned
        favorite = original.favorite
        inFreeHeroRotation = original.inFreeHeroRotation
        
    }

    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        //let hero = aDecoder.decodeObjectForKey("hero") as! JsonHero
        let hero = aDecoder.decodeObject(forKey: "hero") as! HeroData
        let synergy = aDecoder.decodeObject(forKey: "synergy") as! [Hero]
        let strong = aDecoder.decodeObject(forKey: "strong") as! [Hero]
        let weak = aDecoder.decodeObject(forKey: "weak") as! [Hero]
        let map = aDecoder.decodeObject(forKey: "map") as! [Battleground]
        let tags = aDecoder.decodeObject(forKey: "tags") as! [String]
        let pickValue = aDecoder.decodeDouble(forKey: "pickValue") 
        let pickValueHistory = aDecoder.decodeObject(forKey: "pickValueHistory") as! [Double]
        let builds = aDecoder.decodeObject(forKey: "builds") as! [[String: AnyObject]]
        let owned = aDecoder.decodeBool(forKey: "owned") 
        let favorite = aDecoder.decodeBool(forKey: "favorite") 
        let inFreeHeroRotation = aDecoder.decodeBool(forKey: "inFreeHeroRotation") 
        //self.init(hero: hero)
        self.init(hero: hero, synergy: synergy, strong: strong, weak: weak, map: map, tags: tags, pickValue: pickValue, pickValueHistory: pickValueHistory, builds: builds, owned: owned, favorite: favorite, inFreeHeroRotation: inFreeHeroRotation)


        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.hero, forKey: "hero")
        aCoder.encode(self.synergy, forKey: "synergy")
        aCoder.encode(self.strong, forKey: "strong")
        aCoder.encode(self.weak, forKey: "weak")
        aCoder.encode(self.map, forKey: "map")
        aCoder.encode(self.tags, forKey: "tags")
        aCoder.encode(self.pickValue, forKey: "pickValue")
        aCoder.encode(self.pickValueHistory, forKey: "pickValueHistory")
        aCoder.encode(self.builds, forKey: "builds")
        aCoder.encode(self.owned, forKey: "owned")
        aCoder.encode(self.favorite, forKey: "favorite")
        aCoder.encode(self.inFreeHeroRotation, forKey: "inFreeHeroRotation")
        
    }
    
}
