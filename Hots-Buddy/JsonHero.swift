////
////  jsonHero.swift
////  Hots-Buddy
////
////  Created by Alexander Appugliese on 9/10/16.
////  Copyright © 2016 AppleGaming. All rights reserved.
////
//
//import Foundation
//import UIKit
//
//
//
//
//class JsonHero: NSObject, NSCoding {
//    let id: String
//    let attributeId: String
//    var name: String
//    let title: String
//    let heroDescription: String
//    let role: String
//    let type: String
//    let gender: String
//    let franchise: String
//    let difficulty: String
//    let icon: String
//    let ratings: Ratings
//    let stats: [String: Stats]
//    let talents: [String: [Talent]]
//    let abilities: [String: [Ability]]
//    
//    
//    init(id: String, attributeId: String, name: String, title: String, heroDescription: String, role: String, type: String,
//         gender: String, franchise: String, difficulty: String, icon: String, ratings: Ratings, stats: [String:Stats],
//         talents: [String: [Talent]], abilities: [String: [Ability]]) { //synergy: [String], strong: [String], weak: [String], map: [String], tags: [String], pickValue: Int)
//        
//        self.id = id
//        self.attributeId = attributeId
//        self.name = name
//        self.title = title
//        self.heroDescription = heroDescription
//        self.role = role
//        self.type = type
//        self.gender = gender
//        self.franchise = franchise
//        self.difficulty = difficulty
//        self.icon = icon
//        self.ratings = ratings
//        self.stats = stats
//        self.talents = talents
//        self.abilities = abilities
//        //        self.synergy = synergy
//        //        self.strong = strong
//        //        self.weak = weak
//        //        self.map = map
//        //        self.tags = tags
//        //        self.pickValue = pickValue
//        super.init()
//    }
//    
//    convenience init(fromDictionary dict: [String: AnyObject]) {
//        
//        
//        var statsDict = [String: Stats]()
//        for (heroId, stats) in dict["stats"] as! [String: [String: AnyObject]] {
//            statsDict[heroId] = Stats(fromDictionary: stats)
//        }
//        
//        var talentsDict = [String: [Talent]]()
//        for (level, talents) in dict["talents"] as! [String: [[String: AnyObject]]] {
//            talentsDict[level] = talents.map{ Talent(fromDictionary: $0) }
//        }
//        
//        let ratingsDict = dict["ratings"] as! [String: AnyObject]
//        
//        var abilitiesDict = [String: [Ability]]()
//        for (heroId, abilities) in dict["abilities"] as! [String: [[String: AnyObject]]] {
//            abilitiesDict[heroId] = abilities.map{ Ability(fromDictionary: $0) }
//        }
//        
//        
//        
//        self.init(
//            id: dict["id"] as! String,
//            attributeId: dict["attributeid"] as! String,
//            name: dict["name"] as! String,
//            title: dict["title"] as! String,
//            heroDescription: dict["description"] as! String,
//            role: dict["role"] as! String,
//            type: dict["type"] as! String,
//            gender: dict["gender"] as! String,
//            franchise: dict["franchise"] as! String,
//            difficulty: dict["difficulty"] as! String,
//            icon: dict["icon"] as! String,
//            ratings: Ratings(fromDictionary: ratingsDict), //ratings: dict["ratings"] as! Ratings, with ratings: [:] | ratings: dict["ratings"] as! Ratings,
//            stats: statsDict,
//            talents: talentsDict,
//            abilities: abilitiesDict
//        )
//    }
//    
//    
//    
//    //include all properties you want to store
//    required convenience init?(coder aDecoder: NSCoder) {
//        
//        let id = aDecoder.decodeObjectForKey("id") as! String
//        let attributeId = aDecoder.decodeObjectForKey("attributeId") as! String
//        let name = aDecoder.decodeObjectForKey("name") as! String
//        let title = aDecoder.decodeObjectForKey("title") as! String
//        let heroDescription = aDecoder.decodeObjectForKey("heroDescription") as! String
//        let role = aDecoder.decodeObjectForKey("role") as! String
//        let type = aDecoder.decodeObjectForKey("type") as! String
//        let gender = aDecoder.decodeObjectForKey("gender") as! String
//        let franchise = aDecoder.decodeObjectForKey("franchise") as! String
//        let difficulty = aDecoder.decodeObjectForKey("difficulty") as! String
//        let icon = aDecoder.decodeObjectForKey("icon") as! String
//        let ratings = aDecoder.decodeObjectForKey("ratings") as! Ratings
//        let stats = aDecoder.decodeObjectForKey("stats") as! [String: Stats]
//        let talents = aDecoder.decodeObjectForKey("talents") as! [String: [Talent]]
//        let abilities = aDecoder.decodeObjectForKey("abilities") as! [String: [Ability]]
//        self.init(id: id, attributeId: attributeId, name: name, title: title, heroDescription: heroDescription, role: role, type: type, gender: gender, franchise: franchise, difficulty: difficulty, icon: icon, ratings: ratings, stats: stats, talents: talents, abilities: abilities)
//        //, synergy: synergy, strong: strong, weak: weak, map: map, tags: tags, pickValue: pickValue)
//        
//        
//    }
//    
//    //include all properties you want to load
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        
//        aCoder.encodeObject(self.id, forKey: "id")
//        aCoder.encodeObject(self.attributeId, forKey: "attributeId")
//        aCoder.encodeObject(self.name, forKey: "name")
//        aCoder.encodeObject(self.title, forKey: "title")
//        aCoder.encodeObject(self.heroDescription, forKey: "heroDescription")
//        aCoder.encodeObject(self.role, forKey: "role")
//        aCoder.encodeObject(self.type, forKey: "type")
//        aCoder.encodeObject(self.gender, forKey: "gender")
//        aCoder.encodeObject(self.franchise, forKey: "franchise")
//        aCoder.encodeObject(self.difficulty, forKey: "difficulty")
//        aCoder.encodeObject(self.icon, forKey: "icon")
//        aCoder.encodeObject(self.ratings, forKey: "ratings")
//        aCoder.encodeObject(self.stats, forKey: "stats")
//        aCoder.encodeObject(self.talents, forKey: "talents")
//        aCoder.encodeObject(self.abilities, forKey: "abilities")
//
//        
//    }
//    
//}
//
//class Ratings: NSObject, NSCoding {
//    let damage: Int
//    let utility: Int
//    let survivability: Int
//    let complexity: Int
//    
//    init(damage: Int, utility: Int, survivability: Int, complexity: Int) {
//        self.damage = damage
//        self.utility = utility
//        self.survivability = survivability
//        self.complexity = complexity
//        
//    }
//    
//    convenience init(fromDictionary dict: [String: AnyObject]) {
//        self.init(
//            damage: dict["damage"] as! Int,
//            utility: dict["utility"] as! Int,
//            survivability: dict["survivability"] as! Int,
//            complexity: dict["complexity"] as! Int
//        )
//    }
//    
//    //include all properties you want to store
//    required convenience init?(coder aDecoder: NSCoder) {
//        
//        let damage = aDecoder.decodeObjectForKey("damage") as! Int
//        let utility = aDecoder.decodeObjectForKey("utility") as! Int
//        let survivability = aDecoder.decodeObjectForKey("survivability") as! Int
//        let complexity = aDecoder.decodeObjectForKey("complexity") as! Int
//        self.init(damage: damage, utility: utility, survivability: survivability, complexity: complexity)
//        
//        
//    }
//    
//    //include all properties you want to load
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        aCoder.encodeObject(self.damage, forKey: "damage")
//        aCoder.encodeObject(self.utility, forKey: "utility")
//        aCoder.encodeObject(self.survivability, forKey: "survivability")
//        aCoder.encodeObject(self.complexity, forKey: "complexity")
//    }
//    
//}
//
//
//
//
//
//class Stats: NSObject, NSCoding {
//    let hp: Int
//    let hpPerLevel: Int
//    let hpRegen: Double
//    let hpRegenPerLevel: Double
//    let mana: Int
//    let manaPerLevel: Int
//    let manaRegen: Double
//    let manaRegenPerLevel: Double
//    
//    
//    init(hp: Int, hpPerLevel: Int, hpRegen: Double, hpRegenPerLevel: Double, mana: Int, manaPerLevel: Int,
//         manaRegen: Double, manaRegenPerLevel: Double) {
//        self.hp = hp
//        self.hpPerLevel = hpPerLevel
//        self.hpRegen = hpRegen
//        self.hpRegenPerLevel = hpRegenPerLevel
//        self.mana = mana
//        self.manaPerLevel = manaPerLevel
//        self.manaRegen = manaRegen
//        self.manaRegenPerLevel = manaRegenPerLevel
//    }
//    
//    convenience init(fromDictionary dict: [String: AnyObject]) {
//        self.init(
//            hp: dict["hp"] as! Int,
//            hpPerLevel: dict["hpPerLevel"] as! Int,
//            hpRegen: dict["hpRegen"] as! Double,
//            hpRegenPerLevel: dict["hpRegenPerLevel"] as! Double,
//            mana: dict["mana"] as! Int,
//            manaPerLevel: dict["manaPerLevel"] as! Int,
//            manaRegen: dict["manaRegen"] as! Double,
//            manaRegenPerLevel: dict["manaRegenPerLevel"] as! Double
//        )
//    }
//    
//    //include all properties you want to store
//    required convenience init?(coder aDecoder: NSCoder) {
//        
//        let hp = aDecoder.decodeObjectForKey("hp") as! Int
//        let hpPerLevel = aDecoder.decodeObjectForKey("hpPerLevel") as! Int
//        let hpRegen = aDecoder.decodeObjectForKey("hpRegen") as! Double
//        let hpRegenPerLevel = aDecoder.decodeObjectForKey("hpRegenPerLevel") as! Double
//        let mana = aDecoder.decodeObjectForKey("mana") as! Int
//        let manaPerLevel = aDecoder.decodeObjectForKey("manaPerLevel") as! Int
//        let manaRegen = aDecoder.decodeObjectForKey("manaRegen") as! Double
//        let manaRegenPerLevel = aDecoder.decodeObjectForKey("manaRegenPerLevel") as! Double
//        
//        self.init(hp: hp, hpPerLevel: hpPerLevel, hpRegen: hpRegen, hpRegenPerLevel: hpRegenPerLevel, mana: mana, manaPerLevel: manaPerLevel, manaRegen: manaRegen, manaRegenPerLevel: manaRegenPerLevel)
//        
//        
//    }
//    
//    //include all properties you want to load
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        
//        aCoder.encodeObject(self.hp, forKey: "hp")
//        aCoder.encodeObject(self.hpPerLevel, forKey: "hpPerLevel")
//        aCoder.encodeObject(self.hpRegen, forKey: "hpRegen")
//        aCoder.encodeObject(self.hpRegenPerLevel, forKey: "hpRegenPerLevel")
//        aCoder.encodeObject(self.mana, forKey: "mana")
//        aCoder.encodeObject(self.manaPerLevel, forKey: "manaPerLevel")
//        aCoder.encodeObject(self.manaRegen, forKey: "manaRegen")
//        aCoder.encodeObject(self.manaRegenPerLevel, forKey: "manaRegenPerLevel")
//        
//    }
//    
//}
//
//
//class Talent: NSObject, NSCoding {
//    let id: String
//    let name: String
//    let talentDescription: String
//    let cooldown: Double?
//    let prerequisite: String?
//    let icon: String
//    
//    init(id: String, name: String, talentDescription: String, cooldown: Double?, prerequisite: String?, icon: String) {
//        self.id = id
//        self.name = name
//        self.talentDescription = talentDescription
//        self.cooldown = cooldown
//        self.prerequisite = prerequisite
//        self.icon = icon
//    }
//    
//    convenience init(fromDictionary dict:[String: AnyObject]) {
//        self.init(
//            id: dict["id"] as! String,
//            name: dict["name"] as! String,
//            talentDescription: dict["description"] as! String,
//            cooldown: dict["cooldown"] as? Double,
//            prerequisite: dict["prerequisite"] as? String,
//            icon: dict["icon"] as! String
//        )
//    }
//    
//    //include all properties you want to store
//    required convenience init?(coder aDecoder: NSCoder) {
//        
//        let id = aDecoder.decodeObjectForKey("id") as! String
//        let name = aDecoder.decodeObjectForKey("name") as! String
//        let talentDescription = aDecoder.decodeObjectForKey("talentDescription") as! String
//        let cooldown = aDecoder.decodeObjectForKey("cooldown") as? Double
//        let prerequisite = aDecoder.decodeObjectForKey("prerequisite") as? String
//        let icon = aDecoder.decodeObjectForKey("icon") as! String
//        
//        self.init(id: id, name: name, talentDescription: talentDescription, cooldown: cooldown, prerequisite: prerequisite, icon: icon)
//        
//    }
//    
//    //include all properties you want to load
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        
//        aCoder.encodeObject(self.id, forKey: "id")
//        aCoder.encodeObject(self.name, forKey: "name")
//        aCoder.encodeObject(self.talentDescription, forKey: "talentDescription")
//        aCoder.encodeObject(self.cooldown, forKey: "cooldown")
//        aCoder.encodeObject(self.prerequisite, forKey: "prerequisite")
//        aCoder.encodeObject(self.icon, forKey: "icon")
//    }
//}
//
//class Ability: NSObject, NSCoding {
//    let id: String
//    let name: String
//    let abilityDescription: String
//    let shortcut: String?
//    let cooldown: Double?
//    let manaCost: Double?
//    let manaCostPerSecond: Double?
//    let aimType: String?
//    let heroic: Bool?
//    let trait: Bool?
//    let mount: Bool?
//    let icon: String?
//    
//    init(id: String, name: String, abilityDescription: String, shortcut: String?, cooldown: Double?, manaCost: Double?,
//         manaCostPerSecond: Double?, aimType: String?, heroic: Bool?, trait: Bool?, mount: Bool?, icon: String?) {
//        self.id = id
//        self.name = name
//        self.abilityDescription = abilityDescription
//        self.shortcut = shortcut
//        self.cooldown = cooldown
//        self.manaCost = manaCost
//        self.manaCostPerSecond = manaCostPerSecond
//        self.aimType = aimType
//        self.heroic = heroic
//        self.trait = trait
//        self.mount = mount
//        self.icon = icon
//    }
//    
//    convenience init(fromDictionary dict:[String: AnyObject]) {
//        self.init(
//            id: dict["id"] as! String,
//            name: dict["name"] as! String,
//            abilityDescription: dict["description"] as! String,
//            shortcut: dict["shortcut"] as? String,
//            cooldown: dict["cooldown"] as? Double,
//            manaCost: dict["manaCost"] as? Double,
//            manaCostPerSecond: dict["manaCostPerSecond"] as? Double,
//            aimType: dict["aimType"] as? String,
//            heroic: dict["heroic"] as? Bool,
//            trait: dict["trait"] as? Bool,
//            mount: dict["mount"] as? Bool,
//            icon: dict["icon"] as? String
//        )
//    }
//    //include all properties you want to store
//    required convenience init?(coder aDecoder: NSCoder) {
//        
//        let id = aDecoder.decodeObjectForKey("id") as! String
//        let name = aDecoder.decodeObjectForKey("name") as! String
//        let abilityDescription = aDecoder.decodeObjectForKey("abilityDescription") as! String
//        let shortcut = aDecoder.decodeObjectForKey("shortcut") as? String
//        let cooldown = aDecoder.decodeObjectForKey("cooldown") as? Double
//        let manaCost = aDecoder.decodeObjectForKey("manaCost") as? Double
//        let manaCostPerSecond = aDecoder.decodeObjectForKey("manaCostPerSecond") as? Double
//        let aimType = aDecoder.decodeObjectForKey("aimType") as? String
//        let heroic = aDecoder.decodeObjectForKey("heroic") as? Bool
//        let trait = aDecoder.decodeObjectForKey("trait") as? Bool
//        let mount = aDecoder.decodeObjectForKey("mount") as? Bool
//        let icon = aDecoder.decodeObjectForKey("icon") as? String
//        self.init(id: id, name: name, abilityDescription: abilityDescription, shortcut: shortcut, cooldown: cooldown, manaCost: manaCost, manaCostPerSecond: manaCostPerSecond, aimType: aimType, heroic: heroic, trait: trait, mount: mount, icon: icon)
//        
//        
//    }
//    
//    //include all properties you want to load
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        
//        aCoder.encodeObject(self.id, forKey: "id")
//        aCoder.encodeObject(self.name, forKey: "name")
//        aCoder.encodeObject(self.abilityDescription, forKey: "abilityDescription")
//        aCoder.encodeObject(self.shortcut, forKey: "shortcut")
//        aCoder.encodeObject(self.cooldown, forKey: "cooldown")
//        aCoder.encodeObject(self.manaCost, forKey: "manaCost")
//        aCoder.encodeObject(self.manaCostPerSecond, forKey: "manaCostPerSecond")
//        aCoder.encodeObject(self.aimType, forKey: "aimType")
//        aCoder.encodeObject(self.heroic, forKey: "heroic")
//        aCoder.encodeObject(self.trait, forKey: "trait")
//        aCoder.encodeObject(self.mount, forKey: "mount")
//        aCoder.encodeObject(self.icon, forKey: "icon")
//        
//    }
//    
//}
//
//func parseHeroesData(callback: (heroesArrayFromParse: [Hero]) -> Void) {
//    
//    
//    let urlString = "http://heroesjson.com/heroes.json"
//    let session = NSURLSession.sharedSession()
//    let url = NSURL(string: urlString)!
//    
//    session.dataTaskWithURL(url) { (data: NSData?, response:NSURLResponse?, error: NSError?) -> Void in
//        
//        
//        guard let responseData = data else { return }
//        var json: [[String: AnyObject]]!
//        
//        do {
//            json = try NSJSONSerialization.JSONObjectWithData(responseData, options: NSJSONReadingOptions.AllowFragments) as! [[String: AnyObject]]
//            //print(json)
//            
//        }
//        catch {
//            //handle error
//        }
//        
//        //...
//        
//        var arrayToReturn = [Hero]()
//        for element in json {
//            
//            print(element)
//            let jsonHero = JsonHero(fromDictionary: element as! [String: AnyObject])
//            let hero = Hero(hero: jsonHero, synergy: [Hero](), strong: [Hero](), weak: [Hero](), map: [Battleground](), tags: [""], pickValue: 0, pickValueHistory: [Double](), builds: [[String: AnyObject]](), owned: false, favorite: false, inFreeHeroRotation: false)
//            arrayToReturn.append(hero)
//            
//        }
//        
//        callback(heroesArrayFromParse: arrayToReturn)
//        }.resume()//Closes Session.dataTaskWithURL
//    //print("outside of resume \(heroes)")
//} //Closes parseHeroesData()
//
//
//var dummyHero = Hero(hero: JsonHero(id: "", attributeId: "", name: "pickYourHero", title: "", heroDescription: "", role: "", type: "", gender: "", franchise: "", difficulty: "", icon: "", ratings: Ratings(damage: 0, utility: 0, survivability: 0, complexity: 0), stats: ["" : Stats(hp: 0, hpPerLevel: 0, hpRegen: 0.0, hpRegenPerLevel: 0.0, mana: 0, manaPerLevel: 0, manaRegen: 0.0, manaRegenPerLevel: 0.0)], talents: ["" : [Talent(id: "", name: "", talentDescription: "", cooldown: 0, prerequisite: "", icon: "")]], abilities: ["" : [Ability(id: "", name: "", abilityDescription: "", shortcut: "", cooldown: 0.0, manaCost: 0.0, manaCostPerSecond: 0.0, aimType: "", heroic: false, trait: false, mount: false, icon: "")]]), synergy: [], strong: [], weak: [], map: [], tags: [], pickValue: 0, pickValueHistory: [], builds: [[:]], owned: false, favorite: false, inFreeHeroRotation: false)


