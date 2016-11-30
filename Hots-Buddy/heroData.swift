//
//  heroData.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/18/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation




class HeroData: NSObject, NSCoding {
    
    var name: String
    let title: String
    let role: String
    let type: String
    let franchise: String
    let stats: Stats
    let ratings: Ratings
    let talents: [String: [Talent]] //array of
    let abilities: [Ability]
    
    
    init(name: String, title: String, role: String, type: String,
          franchise: String, ratings: Ratings, stats: Stats,
         talents: [String: [Talent]], abilities: [Ability]) { //synergy: [String], strong: [String], weak: [String], map: [String], tags: [String], pickValue: Int)
        
       
        self.name = name
        self.title = title
        self.role = role
        self.type = type
        self.franchise = franchise
        self.ratings = ratings
        self.stats = stats
        self.talents = talents
        self.abilities = abilities
        //        self.synergy = synergy
        //        self.strong = strong
        //        self.weak = weak
        //        self.map = map
        //        self.tags = tags
        //        self.pickValue = pickValue
        super.init()
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
        
        
//        var statsDict = [String: Stats]()
//        for (heroId, stats) in dict["stats"] as! [String: [String: AnyObject]] {
//            statsDict[heroId] = Stats(fromDictionary: stats)
//        }
        //var statsDict = [String: Stats]()
        
        let statsDict = dict["basicInfo"]![0] as! [String: AnyObject]
        
        
        
        let abilitiesArray = dict["abilities"] as! [[String: AnyObject]]
        
        let tempArray = abilitiesArray.map{ Ability(fromDictionary: $0) }
        
        
         let basicDict = dict["basicInfo"]![0] as! [String: AnyObject]
        
//        var abilitiesDict = [Ability]()
//        for item in dict["abilities"] as! [[String: AnyObject]] {
//            abilitiesDict = item.map{ Ability(fromDictionary: $0) }
//        }
        
        let levelLabels = ["1", "4", "7", "10", "13", "16", "20"]
        var talentsDict = [String: [Talent]]()
        var tempCount = 0
        for item in dict["talents"] as! [[String: AnyObject]] {
            
            let talents = item["talents"] as! [[String: AnyObject]]
            
            talentsDict["\(levelLabels[tempCount])"] = talents.map{ Talent(fromDictionary: $0) }
            
            
//            for ("talents", talents) in item  as! [String: [[String: AnyObject]]] {
//                talentsDict["\(levelLabels[tempCount])"] = talents.map{ Talent(fromDictionary: $0) }
//            }
//            
            //talentsDict["\(levelLabels[tempCount])"] = abilities.map{ Talent(fromDictionary: $0) }
            tempCount = tempCount + 1
            
        }
        
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
        
        
        
        
        
        self.init(
            
            name: handleJsonErrors(basicDict["name"], type: "string") as! String,
            title: handleJsonErrors(basicDict["title"], type: "string") as! String,
            role: handleJsonErrors(basicDict["role"], type: "string") as! String,
            type: handleJsonErrors(basicDict["type"], type: "string") as! String,
            franchise: handleJsonErrors(basicDict["franchise"], type: "string") as! String,
            ratings: Ratings(),
            stats: Stats(fromDictionary: statsDict),
            talents: talentsDict,
            abilities: tempArray
        )
    }
    
    
    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let title = aDecoder.decodeObject(forKey: "title") as! String
        let role = aDecoder.decodeObject(forKey: "role") as! String
        let type = aDecoder.decodeObject(forKey: "type") as! String
        let franchise = aDecoder.decodeObject(forKey: "franchise") as! String
        let ratings = aDecoder.decodeObject(forKey: "ratings") as! Ratings
        let stats = aDecoder.decodeObject(forKey: "stats") as! Stats
        let talents = aDecoder.decodeObject(forKey: "talents") as! [String: [Talent]]
        let abilities = aDecoder.decodeObject(forKey: "abilities") as! [Ability]
        self.init(name: name, title: title, role: role, type: type, franchise: franchise, ratings: ratings, stats: stats, talents: talents, abilities: abilities)
        //, synergy: synergy, strong: strong, weak: weak, map: map, tags: tags, pickValue: pickValue)
        
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        
 
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.title, forKey: "title")
        aCoder.encode(self.role, forKey: "role")
        aCoder.encode(self.type, forKey: "type")
        aCoder.encode(self.franchise, forKey: "franchise")
        aCoder.encode(self.ratings, forKey: "ratings")
        aCoder.encode(self.stats, forKey: "stats")
        aCoder.encode(self.talents, forKey: "talents")
        aCoder.encode(self.abilities, forKey: "abilities")
        
        
    }
    
}

class Ratings: NSObject, NSCoding {
    var damage = 0
    var utility = 0
    var survivability = 0
    var complexity = 0
    
    override init(){
        
    }
    
//    convenience init(fromDictionary dict: [String: AnyObject]) {
//        self.init(
//            damage: dict["damage"] as! Int,
//            utility: dict["utility"] as! Int,
//            survivability: dict["survivability"] as! Int,
//            complexity: dict["complexity"] as! Int
//        )
//    }
    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        let damage = aDecoder.decodeInteger(forKey: "damage")
        let utility = aDecoder.decodeInteger(forKey: "utility") 
        let survivability = aDecoder.decodeInteger(forKey: "survivability")
        let complexity = aDecoder.decodeInteger(forKey: "complexity")
        self.init()
        
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.damage, forKey: "damage")
        aCoder.encode(self.utility, forKey: "utility")
        aCoder.encode(self.survivability, forKey: "survivability")
        aCoder.encode(self.complexity, forKey: "complexity")
    }
    
}





class Stats: NSObject, NSCoding {
    let health: Int
    let healthPerLevel: Int
    let healthRegen: Double
    let healthRegenPerLevel: Double
    let mana: Int
    let manaPerLevel: Int
    let manaRegen: Double
    let manaRegenPerLevel: Double
    let speed: Double
    let attackSpeed: Double
    let attackRange: Double
    let attackDamage: Double
    let rangedDamagePerLevel: Double
    let splashDamagePerLevel: Double
    
    
    init(health: Int, healthPerLevel: Int, healthRegen: Double, healthRegenPerLevel: Double, mana: Int, manaPerLevel: Int,
         manaRegen: Double, manaRegenPerLevel: Double, speed: Double, attackSpeed: Double, attackRange: Double, attackDamage: Double, rangedDamagePerLevel: Double, splashDamagePerLevel: Double) {
        self.health = health
        self.healthPerLevel = healthPerLevel
        self.healthRegen = healthRegen
        self.healthRegenPerLevel = healthRegenPerLevel
        self.mana = mana
        self.manaPerLevel = manaPerLevel
        self.manaRegen = manaRegen
        self.manaRegenPerLevel = manaRegenPerLevel
        self.speed = speed
        self.attackSpeed = attackSpeed
        self.attackRange = attackRange
        self.attackDamage = attackDamage
        self.rangedDamagePerLevel = rangedDamagePerLevel
        self.splashDamagePerLevel = splashDamagePerLevel
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
        self.init(
            health: handleJsonErrors(dict["health"], type: "int") as! Int,
            healthPerLevel: handleJsonErrors(dict["healthPerLevel"], type: "int") as! Int,
            healthRegen: handleJsonErrors(dict["healthRegen"], type: "double") as! Double,
            healthRegenPerLevel: handleJsonErrors(dict["healthRegenPerLevel"], type: "double") as! Double,
            mana: handleJsonErrors(dict["mana"], type: "int") as! Int,
            manaPerLevel: handleJsonErrors(dict["manaPerLevel"], type: "int") as! Int,
            manaRegen: handleJsonErrors(dict["manaRegen"], type: "double") as! Double,
            manaRegenPerLevel: handleJsonErrors(dict["manaRegenPerLevel"], type: "double") as! Double,
            speed: handleJsonErrors(dict["speed"], type: "double") as! Double,
            attackSpeed: handleJsonErrors(dict["attackSpeed"], type: "double") as! Double,
            attackRange: handleJsonErrors(dict["attackRange"], type: "double") as! Double,
            attackDamage: handleJsonErrors(dict["attackDamage"], type: "double") as! Double,
            rangedDamagePerLevel: handleJsonErrors(dict["rangedDamagePerLevel"], type: "double") as! Double,
            splashDamagePerLevel: handleJsonErrors(dict["splashDamagePerLevel"], type: "double") as! Double
        )
    }
    // rangedDamagePerLevel: Double(removeSpecialCharsFromString(((dict["rangedDamagePerLevel"] as? String) ?? "0.0")))
    //rangedDamagePerLevel: Double((removeSpecialCharsFromString(((dict["rangedDamagePerLevel"] as? String) ?? "0.0")!))),

    
    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        let health = aDecoder.decodeInteger(forKey: "health") 
        let healthPerLevel = aDecoder.decodeInteger(forKey: "healthPerLevel") 
        let healthRegen = aDecoder.decodeDouble(forKey: "healthRegen")
        let healthRegenPerLevel = aDecoder.decodeDouble(forKey: "healthRegenPerLevel")
        let mana = aDecoder.decodeInteger(forKey: "mana")
        let manaPerLevel = aDecoder.decodeInteger(forKey: "manaPerLevel")
        let manaRegen = aDecoder.decodeDouble(forKey: "manaRegen")
        let manaRegenPerLevel = aDecoder.decodeDouble(forKey: "manaRegenPerLevel")
        let speed = aDecoder.decodeDouble(forKey: "speed")
        let attackSpeed = aDecoder.decodeDouble(forKey: "attackSpeed")
        let attackRange = aDecoder.decodeDouble(forKey: "attackRange")
        let attackDamage = aDecoder.decodeDouble(forKey: "attackDamage")
        let rangedDamagePerLevel = aDecoder.decodeDouble(forKey: "rangedDamagePerLevel")
        let splashDamagePerLevel = aDecoder.decodeDouble(forKey: "splashDamagePerLevel")
        
        self.init(health: health, healthPerLevel: healthPerLevel, healthRegen: healthRegen, healthRegenPerLevel: healthRegenPerLevel, mana: mana, manaPerLevel: manaPerLevel, manaRegen: manaRegen, manaRegenPerLevel: manaRegenPerLevel, speed: speed, attackSpeed: attackSpeed, attackRange: attackRange, attackDamage: attackDamage, rangedDamagePerLevel: rangedDamagePerLevel, splashDamagePerLevel: splashDamagePerLevel)
        
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        
        aCoder.encode(self.health, forKey: "health")
        aCoder.encode(self.healthPerLevel, forKey: "healthPerLevel")
        aCoder.encode(self.healthRegen, forKey: "healthRegen")
        aCoder.encode(self.healthRegenPerLevel, forKey: "healthRegenPerLevel")
        aCoder.encode(self.mana, forKey: "mana")
        aCoder.encode(self.manaPerLevel, forKey: "manaPerLevel")
        aCoder.encode(self.manaRegen, forKey: "manaRegen")
        aCoder.encode(self.manaRegenPerLevel, forKey: "manaRegenPerLevel")
        aCoder.encode(self.speed, forKey: "speed")
        aCoder.encode(self.attackSpeed, forKey: "attackSpeed")
        aCoder.encode(self.attackRange, forKey: "attackRange")
        aCoder.encode(self.attackDamage, forKey: "attackDamage")
        aCoder.encode(self.rangedDamagePerLevel, forKey: "rangedDamagePerLevel")
        aCoder.encode(self.splashDamagePerLevel, forKey: "splashDamagePerLevel")
        
    }
    
}




class Talent: NSObject, NSCoding {
    
    let name: String
    let talentDescription: String
    let cooldown: Double
    let image: String
    let image_url: String
    
    init(name: String, talentDescription: String, cooldown: Double, image: String, image_url: String) {
        self.name = name
        self.talentDescription = talentDescription
        self.cooldown = cooldown
        self.image = image
        self.image_url = image_url
        
    }
    
    convenience init(fromDictionary dict:[String: AnyObject]) {
        self.init(
            name: handleJsonErrors(dict["name"], type: "string") as! String,
            talentDescription: handleJsonErrors(dict["talentDescription"], type: "string") as! String,
            cooldown: handleJsonErrors(dict["cooldown"], type: "double") as! Double,
            image: handleJsonErrors(dict["image"], type: "string") as! String,
            image_url: handleJsonErrors(dict["image_url"], type: "string") as! String
            
        )
    }
    
    //include all properties you want to store
    required convenience init(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let talentDescription = aDecoder.decodeObject(forKey: "talentDescription") as! String
        let cooldown = aDecoder.decodeDouble(forKey: "cooldown")
        let image = aDecoder.decodeObject(forKey: "image") as! String
        let image_url = aDecoder.decodeObject(forKey: "image_url") as! String

        
        self.init(name: name, talentDescription: talentDescription, cooldown: cooldown, image: image, image_url: image_url)
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.talentDescription, forKey: "talentDescription")
        aCoder.encode(self.cooldown, forKey: "cooldown")
        aCoder.encode(self.image, forKey: "image")
        aCoder.encode(self.image_url, forKey: "image_url")
    }
}



class Ability: NSObject, NSCoding {
    let name: String
    let abilityDescription: String
    let shortcut: String
    let cooldown: Double
    let manaCost: Double
    let image: String
    let image_url: String
    
    
    init(name: String, abilityDescription: String, shortcut: String, cooldown: Double, manaCost: Double, image: String, image_url: String) {
        self.name = name
        self.abilityDescription = abilityDescription
        self.shortcut = shortcut
        self.cooldown = cooldown
        self.manaCost = manaCost
        self.image = image
        self.image_url = image_url
    }
    
    convenience init(fromDictionary dict:[String: AnyObject]) {
        self.init(
            name: handleJsonErrors(dict["name"], type: "string") as! String,
            abilityDescription: handleJsonErrors(dict["abilityDescription"], type: "string") as! String,
            shortcut: handleJsonErrors(dict["shortcut"], type: "string") as! String,
            cooldown: handleJsonErrors(dict["cooldown"], type: "double") as! Double,
            manaCost: handleJsonErrors(dict["manaCost"], type: "double") as! Double,
            image: handleJsonErrors(dict["image"], type: "string") as! String,
            image_url: handleJsonErrors(dict["image_url"], type: "string") as! String
        )
    }
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let abilityDescription = aDecoder.decodeObject(forKey: "abilityDescription") as! String
        let shortcut = aDecoder.decodeObject(forKey: "shortcut") as! String
        let cooldown = aDecoder.decodeDouble(forKey: "cooldown")
        let manaCost = aDecoder.decodeDouble(forKey: "manaCost")
        let image = aDecoder.decodeObject(forKey: "image") as! String
        let image_url = aDecoder.decodeObject(forKey: "image_url") as! String
        
        self.init(name: name, abilityDescription: abilityDescription, shortcut: shortcut, cooldown: cooldown, manaCost: manaCost, image: image, image_url: image_url)
        
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.abilityDescription, forKey: "abilityDescription")
        aCoder.encode(self.shortcut, forKey: "shortcut")
        aCoder.encode(self.cooldown, forKey: "cooldown")
        aCoder.encode(self.manaCost, forKey: "manaCost")
        aCoder.encode(self.image, forKey: "image")
        aCoder.encode(self.image_url, forKey: "image_url")
        
    }
    
}


//extension Restaurant {
//    private let urlComponents: URLComponents // base URL components of the web service
//    private let session: URLSession // shared session for interacting with the web service
//    
//    static func restaurants(matching query: String, completion: ([Restaurant]) -> Void) {
//        var searchURLComponents = urlComponents
//        searchURLComponents.path = "/search"
//        searchURLComponents.queryItems = [URLQueryItem(name: "q", value: query)]
//        let searchURL = searchURLComponents.url!
//        
//        session.dataTask(url: searchURL, completion: { (_, _, data, _)
//            var restaurants: [Restaurant] = []
//            
//            if let data = data,
//                let json = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
//                for case let result in json["results"] {
//                    if let restaurant = Restaurant(json: result) {
//                        restaurants.append(restaurant)
//                    }
//                }
//            }
//            
//            completion(restaurants)
//        }).resume()
//    }
//}



func parseHeroesData(_ callback: @escaping (_ heroesArrayFromParse: [Hero]) -> Void) {

    
    let urlString = "https://www.parsehub.com/api/v2/projects/\(heroesDataProject)/last_ready_run/data?api_key=t4bm23r0ByoX"
    //let urlString = "https://www.parsehub.com/api/v2/runs/t3yeskMB7GUn/data?api_key=t4bm23r0ByoX" // runs
    let session = URLSession.shared
    let url = URL(string: urlString)!

    session.dataTask(with: url, completionHandler: { data, response, error in


        guard let responseData = data else { return }
        var json: [String: [[String: AnyObject]]]!

        do {
            json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: [[String: AnyObject]]]
            print("sucessfully got JSON")

        }
        catch {
            print("error reading JSON")
        }

        //...

        var arrayToReturn = [Hero]()
        for element in json["heroes"]! {

            print(element)
            print("try to create hero")
            let heroData = HeroData(fromDictionary: element)
            let hero = Hero(hero: heroData, synergy: [Hero](), strong: [Hero](), weak: [Hero](), map: [Battleground](), tags: [""], pickValue: 0, pickValueHistory: [Double](), builds: [[String: AnyObject]](), owned: false, favorite: false, inFreeHeroRotation: false)
            arrayToReturn.append(hero)

        }
        

        callback(arrayToReturn)
        }).resume()//Closes Session.dataTaskWithURL
    //print("outside of resume \(heroes)")
} //Closes parseHeroesData()




var dummyHero = Hero(hero: HeroData(name: "pickYourHero", title: "", role: "", type: "", franchise: "", ratings: Ratings(), stats: Stats(health: 0, healthPerLevel: 0, healthRegen: 0.0, healthRegenPerLevel: 0.0, mana: 0, manaPerLevel: 0, manaRegen: 0.0, manaRegenPerLevel: 0.0, speed: 0.0, attackSpeed: 0.0, attackRange: 0.0, attackDamage: 0.0, rangedDamagePerLevel: 0.0, splashDamagePerLevel: 0.0), talents: ["" : [Talent(name: "", talentDescription: "", cooldown: 0.0, image: "", image_url: "")]], abilities: [Ability(name: "", abilityDescription: "", shortcut: "", cooldown: 0.0, manaCost: 0.0, image: "", image_url: "")]), synergy: [], strong: [], weak: [], map: [], tags: [], pickValue: 0, pickValueHistory: [], builds: [[:]], owned: false, favorite: false, inFreeHeroRotation: false)



//func removeSpecialCharsFromString(text: String) -> String {
//    
//    //let text = text ?? "0"
//    let okayChars : Set<Character> =
//        Set("1234567890".characters)
//    //Set("abcdefghijklmnopqrstuvwxyz ABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890+-*=(),.:!_".characters)
//    return String(text.characters.filter {okayChars.contains($0) })
//}
//
//
//func parseHeroesData(_ project: String, callback: @escaping (_ heroesArrayFromParse: [Hero]) -> Void) {
//    
//    let project = project
//    //let urlString = "http://heroesjson.com/heroes.json"
//    let urlString = "https://www.parsehub.com/api/v2/projects/\(project)/last_ready_run/data?api_key=t4bm23r0ByoX"
//    //let urlString = "https://www.parsehub.com/api/v2/runs/t3yeskMB7GUn/data?api_key=t4bm23r0ByoX" // runs
//    let session = URLSession.shared
//    let url = URL(string: urlString)!
//    
//    session.dataTask(with: url, completionHandler: { (data: Data?, response:URLResponse?, error: NSError?) -> Void in
//        
//        
//        guard let responseData = data else { return }
//        var json: [String: [[String: AnyObject]]]!
//        
//        do {
//            json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: [[String: AnyObject]]]
//            print("sucessfully got JSON")
//            
//        }
//        catch {
//            print("error reading JSON")
//        }
//        
//        //...
//        
//        var arrayToReturn = [Hero]()
//        for element in json["heroes"]! {
//            
//            print(element)
//            print("try to create hero")
//            let heroData = HeroData(fromDictionary: element)
//            let hero = Hero(hero: heroData, synergy: [Hero](), strong: [Hero](), weak: [Hero](), map: [Battleground](), tags: [""], pickValue: 0, pickValueHistory: [Double](), builds: [[String: AnyObject]](), owned: false, favorite: false, inFreeHeroRotation: false)
//            arrayToReturn.append(hero)
//            
//        }
//        
//        callback(arrayToReturn)
//        } as! (Data?, URLResponse?, Error?) -> Void) .resume()//Closes Session.dataTaskWithURL
//    //print("outside of resume \(heroes)")
//} //Closes parseHeroesData()


