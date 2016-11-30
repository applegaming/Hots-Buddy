//
//  Constants.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/13/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation

var heroesTest = "original"

var heroes = [Hero]()
var battlegrounds = [Battleground]()
var heroesOriginal = [Hero]()
var premadeHeroes = [PremadeHero]()
var heroForDetails = heroes[0]
var userProfile = "heroesOriginal"
var heroArrayToEditInt = 0
var hotsLogsData = [HotsHero]()
var heroesCountersData = [CountersHero]()
var freeHeroRotation = [Hero]()
var topHeroes: [Hero] =  { () -> [Hero] in
    
    print("trying to calculate top heroes")
    
    var arrayToReturn = [Hero]()
    let temp = hotsLogsData.sorted(by: {$1.popularity < $0.popularity})
    //print("\(temp.count) items in temp")
    for item in temp {
        //print("\(item.name)")
        for hero in heroes {
            if item.name == hero.hero.name {
                //print("trying to add to array to return")
                arrayToReturn.append(hero)
            }
        }
    }
    return arrayToReturn
}()

let heroesDataProject = "tgPLos544jLa" //gamepedia
let heroesCountersProject = "tsAYA3pBwbHS" //heroes counters
let hotsLogsProject = "t1xQcweFV534" //hotslogs
let freeHeroRotationProject = "tTmVYSZj5W7G" //free hero rotation

//var userOptions = OptionList(relationships: true)
var userOptions: [[String]] = [
    ["Relationships", "true", "Accounts for all of the data on the relationships screen."],
    ["Skew for 1 Warrior", "true", "Skews warrior pick values until at least 1 tank is picked"],
    ["Skew for 1 Support", "true", "Skews support pick values until at least 1 support is picked"],
    ["Skew for Balanced Team", "false", "Skews hero pick values until at least 1 tank, 1 support, and 1 specialist are picked"],
    
]

var tags: [String: [String:[String: [String]]]] = [
    "Auto Attacker": ["inclusions": ["keyword":["basic attack"]], "exclusions": ["keyword": ["hero basic attacks"], "basic": []]],
"Stun": ["inclusions": ["keyword":["stun"]], "exclusions": ["name": [""], "keyword": [""]]],
"Root": ["inclusions": ["keyword":["root"]], "exclusions": ["name": [""], "keyword": [""]]],
"Slow": ["inclusions": ["keyword":["slow"]], "exclusions": ["name": [""], "keyword": [""]]],
"Silence": ["inclusions": ["keyword":["silence"]], "exclusions": ["name": [""], "keyword": [""]]],
"Polymorph": ["inclusions": ["keyword":["polymorph"]], "exclusions": ["name": [""], "keyword": [""]]]
]

//var tags: [String: [String]] = [
//    "Auto Attacker": ["basic attacks"],
//    "Stun": ["stun"],
//    "Root": ["root"],
//    "Slow": ["slow"],
//    "Silence": ["silence"],
//    "Polymorph": ["polymorph"]]




func saveToDefaults(_ key: String){
    
    switch (key) {
        
    case "heroesOriginal":
        heroes = heroes.sorted(by: {$0.hero.name < $1.hero.name})
        let heroesData = NSKeyedArchiver.archivedData(withRootObject: heroes) //convert to data
        UserDefaults.standard.set(heroesData, forKey: "heroesOriginal") // required for array's / dicts
        UserDefaults.standard.synchronize() // actual saving
        print("Saved Default Heroes")
    case "heroesCustom":
        heroes = heroes.sorted(by: {$0.hero.name < $1.hero.name})
        let heroesData = NSKeyedArchiver.archivedData(withRootObject: heroes) //convert to data
        UserDefaults.standard.set(heroesData, forKey: "heroesCustom") // required for array's / dicts
        UserDefaults.standard.synchronize() // actual saving
        print("Saved Custom Heroes")
    case "battlegrounds":
        let battlegroundsData = NSKeyedArchiver.archivedData(withRootObject: battlegrounds) //convert to data
        UserDefaults.standard.set(battlegroundsData, forKey: "battlegrounds") // required for array's / dicts
        UserDefaults.standard.synchronize() // actual saving
        print("Saved Battlegrounds")
    case "userProfile":
        UserDefaults.standard.set(userProfile, forKey: "userProfile")
    case "userOptions":
        let userOptionsData = NSKeyedArchiver.archivedData(withRootObject: userOptions) //convert to data
        UserDefaults.standard.set(userOptionsData, forKey: "userOptions") // required for array's / dicts
        UserDefaults.standard.synchronize() // actual saving
        print("Saved userOptions")
    case "hotsLogsData":
        let hotsLogsDataArray = NSKeyedArchiver.archivedData(withRootObject: hotsLogsData) //convert to data
        UserDefaults.standard.set(hotsLogsDataArray, forKey: "hotsLogsData") // required for array's / dicts
        UserDefaults.standard.synchronize() // actual saving
        print("Saved HotsLogsData")
    default:
        print("fail")
    }
    
}

func loadFromDefaults(_ key: String){
    
    switch (key) {
        
    case "heroesOriginal":
        if let loadedHeroes = UserDefaults.standard.object(forKey: "heroesOriginal") as? Data {//grab data out of NSUserDefaults and convert it to NSData
            heroes = NSKeyedUnarchiver.unarchiveObject(with: loadedHeroes) as! [Hero] // unarchive it from data to what it used to be
        }
        print("Loaded from Heroes Original")
        
    case "heroesCustom":
        if let loadedHeroes = UserDefaults.standard.object(forKey: "heroesCustom") as? Data {//grab data out of NSUserDefaults and convert it to NSData
            heroes = NSKeyedUnarchiver.unarchiveObject(with: loadedHeroes) as! [Hero] // unarchive it from data to what it used to be
        }
        print("Loaded from Custom Heroes")
        
    case "battlegrounds":
        if let loadedBattlegrounds = UserDefaults.standard.object(forKey: "battlegrounds") as? Data {//grab data out of NSUserDefaults and convert it to NSData
            battlegrounds = NSKeyedUnarchiver.unarchiveObject(with: loadedBattlegrounds) as! [Battleground] // unarchive it from data to what it used to be
            print("Loaded Battlegrounds")
        }
    case "userProfile":
        if let dummy = UserDefaults().object(forKey: "userProfile") as? String {
            userProfile = dummy
            print("Loaded User Profile as \(userProfile)")
        }
    case "userOptions":
        if let loadedUserOptions = UserDefaults.standard.object(forKey: "userOptions") as? Data {//grab data out of NSUserDefaults and convert it to NSData
            userOptions = NSKeyedUnarchiver.unarchiveObject(with: loadedUserOptions) as! [[String]] // unarchive it from data to what it used to be
            print("Loaded User Options")
        }
    case "hotsLogsData":
        if let loadedHotsLogsData = UserDefaults.standard.object(forKey: "hotsLogsData") as? Data {//grab data out of NSUserDefaults and convert it to NSData
            hotsLogsData = NSKeyedUnarchiver.unarchiveObject(with: loadedHotsLogsData) as! [HotsHero] // unarchive it from data to what it used to be
            print("Loaded HotsLogsData")
        }
    default:
        print("FAIL - Use a Different Key")
    }
    
}



func createPopularBuilds(){
    
    let levels = [1, 4, 7, 10, 13, 16, 20]
    var build = [String: AnyObject]()
    

    for hero in heroes {
        
        var hotsHeroTalents = [HotsTalent]()
        
        for hotsHero in hotsLogsData {
            if hero.hero.name == hotsHero.name {
                hotsHeroTalents = hotsHero.talents
                break
                
            }
        }
        
        
        for item in levels {
            
            var popularityToBeat = 0.0
            
            for talent in hero.hero.talents["\(item)"]! { // loop through the hero talents at the appropriate leveltalents
                for hotsTalent in hotsHeroTalents {
                    if hotsTalent.name == talent.name && hotsTalent.popularity > popularityToBeat {
                        //compare whats in build with whats possible to add
                        build["\(item)"] = talent
                        popularityToBeat = hotsTalent.popularity
                    }
                }
            }
        }
        
        print("*createPopularBuilds - \(hero.hero.name)")
        let testForDummy = build["1"] as! Talent
        if testForDummy.talentDescription == "Pick a Talent" {
            build["name"] = "Hero is too New" as AnyObject?
        } else {
            build["name"] = "Most Popular Build" as AnyObject?
        }
        
        hero.builds.insert(build, at: 0)
        
        for item in levels {
            build["\(item)"] = Talent(name: "Level \(item)", talentDescription: "Pick a Talent", cooldown: 0.0, image: "", image_url: "")
        }
        

        
        

    }
    
    saveToDefaults(userProfile)
    
}

func removeNoKeyExists(){
    for hero in heroes{
        print(hero.hero.name)
        if hero.hero.name == "No Key Exists" {
            let indexOfHero = heroes.index(of: hero)
            print("*removeNoKeyExists - \(heroes[indexOfHero!])")
            heroes.remove(at: indexOfHero!)
            break
        }
    }
}

func createTags(){
  
//    //for each tag to search for look through each hero
//    for (tag, searchStrings) in tags {
//        for hero in heroes {
//            //search abilities
//            for (key, value)  in hero.hero.abilities{
//                if key == hero.hero.id {
//                    for ability in value{
//                        if checkForInclusions(hero, ability: ability, tag: tag) == true && checkForExclusions(hero, ability: ability, tag: tag) == false && checkForDuplicateTag(hero, tag: tag) == false {
//                            hero.tags.append(tag)
//                        }
//
//                    }
//                }
//            }
//            //search talents
//            for (key, value) in hero.hero.talents {
//                
//            }
//        }
//    }
//    
//    for hero in heroes {
//        if hero.tags.contains("Auto Attacker") {
//            print(" \(hero.hero.name)")
//            
//        }
//    }
}

func checkForDuplicateTag(_ hero: Hero, tag: String) -> Bool {
    
    for item in hero.tags {
        if tag == item {
            return true
        }
    }
    return false
}

func checkForInclusions(_ hero: Hero, ability: Ability, tag: String) -> Bool {
    
    for (key, value) in tags[tag]!["inclusions"]! {
        switch key {
        case "keyword":
            for item in tags[tag]!["inclusions"]!["keyword"]! {
                if ability.abilityDescription.lowercased().range(of: item) != nil {
                    return true
                }
            }
        default:
            break
        }
    }
    
    
    
    
   return false
    
}

func checkForExclusions(_ hero: Hero, ability: Ability, tag: String) -> Bool {
   
    for (key, value) in tags[tag]!["exclusions"]! {
        switch key {
        case "keyword":
            for item in tags[tag]!["exclusions"]![key]! {
                if ability.abilityDescription.lowercased().range(of: item) != nil {
                    return true
                }
            }
        case "name":
            for item in tags[tag]!["exclusions"]![key]! {
                if hero.hero.name.lowercased().range(of: item) != nil {
                    return true
                }
            }
        case "basic":
            if ability.shortcut != "Q" && ability.shortcut != "W" && ability.shortcut != "E" {
                return true
            }
        default:
            break
        
        }
    }
//    for item in tags[tag]!["exclusions"]!["keyword"]! {
//        if ability.abilityDescription.lowercaseString.rangeOfString(item) != nil {
//            return true
//        }
//    }
//    for item in tags[tag]!["exclusions"]!["name"]! {
//        if hero.hero.name.lowercaseString.rangeOfString(item) != nil {
//            return true
//        }
//    }
    
    return false
}


func checkForFreeHeroes() {
    
    
}

func createRelationships(){ // do I keep relationships as countersHero or convert to Hero
    
    var count = 0
    
    for hero in heroes {
        for item in heroesCountersData {
            
            if hero.hero.name == item.name {
                
                var pointsSum = 0
                for synergyHero in item.synergy{
                    pointsSum = pointsSum + synergyHero.points
                }
                let pointsThreshold = min(Int(round(((Double(pointsSum) / Double(item.synergy.count)) * 1.5))), 75)
                
                let synergyArray = item.synergy.filter( { $0.points >= pointsThreshold } )
                for tempHero in synergyArray {
                    //hero.synergy.append(tempHero)
                }
                let strongArray = item.strong.filter( { $0.points >= 75 } )
                let weakArray = item.weak.filter( { $0.points >= 75 } )
                let battlegroundsArray = item.battleground.filter( { $0.points >= 65 } )
                
                
                
                for object in synergyArray {
                    print("\(hero.hero.name) has \(object.name) for \(object.points)")
                }
            }
        }
    }
}


func addPremadeHeroToHero(){
    //loadBattlegrounds()

    //*should also convert strings to heroes
    for hero in heroes {
        for premadeHero in premadeHeroes {
            if hero.hero.name == premadeHero.name {//mismatched names can lead to errors in section counts for collection views, errors with butcher, etc, cho'gall, typos in zeratul

                
                var heroesInSynergy = [Hero]()
                var heroesInStrong = [Hero]()
                var heroesInWeak = [Hero]()
                var battlegroundsInHero = [Battleground]()
                
                //hero = abathur and premade hero = abathur
                //for each item in premadeHero.synergy, find the hero in heroes and add it to heroesinsynergy
                
                
                for heroToFill in heroes{
                    for item in premadeHero.synergy {
                        if heroToFill.hero.name == item {
                            heroesInSynergy.append(heroToFill)
                        }
                    }
                }
                for heroToFill in heroes{
                    for item in premadeHero.strong {
                        if heroToFill.hero.name == item {
                            heroesInStrong.append(heroToFill)
                        }
                    }
                }
                for heroToFill in heroes{
                    for item in premadeHero.weak {
                        if heroToFill.hero.name == item {
                            heroesInWeak.append(heroToFill)
                        }
                    }
                }
                for map in battlegrounds{
                    for item in premadeHero.map {
                        if map.name == item {
                            battlegroundsInHero.append(map)
                        }
                    }
                }
                hero.synergy = heroesInSynergy
                hero.strong = heroesInStrong
                hero.weak = heroesInWeak
                hero.map = battlegroundsInHero
                hero.tags = premadeHero.tags
                
                
                
                
                
//                print("\(hero.hero.name)")
//                for each in hero.synergy{
//                    print("Synergy \(each.hero.name)")
//                }
//                for each in hero.map{
//                    print("battleground \(each.name)")
//                }


                
            }
        }
        
        
        for battleground in battlegrounds{
            for map in hero.map{
                if battleground.name == map.name{
                    battleground.synergy.append(hero)
                }
            }
        }
    }//close for hero in heroes
    
    for battleground in battlegrounds{
        print("\(battleground.name) has the following hero Synergies")
        for item in battleground.synergy{print(item.hero.name)}
    }

}



func appendHeroes(){ //initialize and append premade heroes to array so they can be added to Heroes
 
    premadeHeroes.append(abathur)
    premadeHeroes.append(anubArak)
    premadeHeroes.append(artanis)
    premadeHeroes.append(arthas)
    premadeHeroes.append(azmodan)
    premadeHeroes.append(brightwing)
    premadeHeroes.append(chen)
    premadeHeroes.append(cho)
    premadeHeroes.append(chromie)
    premadeHeroes.append(dehaka)
    premadeHeroes.append(diablo)
    premadeHeroes.append(etc)
    premadeHeroes.append(falstad)
    premadeHeroes.append(gall)
    premadeHeroes.append(gazlowe)
    premadeHeroes.append(greymane)
    premadeHeroes.append(gulDan)
    premadeHeroes.append(illidan)
    premadeHeroes.append(jaina)
    premadeHeroes.append(johanna)
    premadeHeroes.append(kaelThas)
    premadeHeroes.append(kerrigan)
    premadeHeroes.append(kharazim)
    premadeHeroes.append(leoric)
    premadeHeroes.append(lili)
    premadeHeroes.append(liMing)
    premadeHeroes.append(ltMorales)
    premadeHeroes.append(lunara)
    premadeHeroes.append(malfurion)
    premadeHeroes.append(medivh)
    premadeHeroes.append(muradin)
    premadeHeroes.append(murky)
    premadeHeroes.append(nazeebo)
    premadeHeroes.append(nova)
    premadeHeroes.append(raynor)
    premadeHeroes.append(rehgar)
    premadeHeroes.append(rexxar)
    premadeHeroes.append(sgtHammer)
    premadeHeroes.append(sonya)
    premadeHeroes.append(stitches)
    premadeHeroes.append(sylvanas)
    premadeHeroes.append(tassadar)
    premadeHeroes.append(theButcher)
    premadeHeroes.append(theLostVikings)
    premadeHeroes.append(thrall)
    premadeHeroes.append(tracer)
    premadeHeroes.append(tychus)
    premadeHeroes.append(tyrael)
    premadeHeroes.append(tyrande)
    premadeHeroes.append(uther)
    premadeHeroes.append(valla)
    premadeHeroes.append(xul)
    premadeHeroes.append(zagara)
    premadeHeroes.append(zeratul)
    
    
}

func appendBattlegrounds(){ //initialize and append premade battlegrounds to array

    battlegrounds.append(battlefieldOfEternity)
    battlegrounds.append(blackheartsBay)
    battlegrounds.append(braxisHoldout)
    battlegrounds.append(cursedHollow)
    battlegrounds.append(dragonShire)
    battlegrounds.append(gardenOfTerror)
    battlegrounds.append(hauntedMines)
    battlegrounds.append(infernalShrines)
    battlegrounds.append(skyTemple)
    battlegrounds.append(tombOfTheSpiderQueen)
    battlegrounds.append(towersOfDoom)
    battlegrounds.append(warheadJunction)
}

func createHeroes(){
    
    parseHeroesData() { heroesArrayFromParse in             //Do stuff after parse
        
        heroes = heroesArrayFromParse
        appendHeroes()
        appendBattlegrounds()
        addPremadeHeroToHero()
        //createTags()
        saveToDefaults("heroesOriginal")
        saveToDefaults("battlegrounds")
    }
}



//func findSynergy(heroArray: [Hero], heroToFilter: String, increment: Int){
//    let heroesWithSynergy = heroArray.filter( { $0.synergy.contains(woFilter) } )//
//    for hero in heroesWithSynergy{
//        hero.pickValue = hero.pickValue + increment
//        
//    }
//}

func findSynergy(_ heroArray: [Hero], heroToFilter: [Hero], increment: Double){
    //print("called map synergy")
    //print("hero to filter \(heroToFilter)")
    //print("hero Array \(heroArray)")
    for heroWithSynergy in heroToFilter{
        for hero in heroArray{
            //print("\(hero.hero.name) and \(heroWithSynergy.hero.name)")
            if heroWithSynergy.hero.name == hero.hero.name{
                //print(" \(heroWithSynergy.hero.name) found a match \(hero.hero.name)")
                hero.pickValue = hero.pickValue + increment
            }
        }
    }
}


func addHeroToEdit(_ hero: Hero, heroArray: inout [Hero]){
    
    print("called Add Hero To Edit")
    var heroInHeroArray = false
    var index = 0
    
    
    for item in heroArray{
        if item.hero.name == hero.hero.name { //if hero is already in hero array get index and remove him
            index = heroArray.index(of: item)!
            heroInHeroArray = true
        }
    }
    
    print(index)
    if heroInHeroArray == true {
        heroArray.remove(at: index)
    } else {
        heroArray.append(hero)
    }
    
    
//    let index = heroArray.indexOf(hero)
//    print(index)
//    if index == nil {
//        heroArray.append(hero)
//        print("added \(hero.hero.name)")
//    } else {
//        heroArray.removeAtIndex(index!)
//        print("removed \(hero.hero.name)")
//    }
    heroArray = heroArray.sorted(by: {$0.hero.name < $1.hero.name})
    
    //for item in heroes { if item.hero.name == heroForDetails.hero.name{ for items in item.synergy{ print("Showing \(items.hero.name) in synergy")}}}
    
}

func addBattlegroundToEdit(_ battleground: Battleground, battlegroundArray: inout [Battleground]){
    
    print("called Add Hero To Edit")
    var battlegroundInBattlegroundArray = false
    var index = 0
    
    
    for item in battlegroundArray{
        if item.name == battleground.name { //if hero is already in hero array get index and remove him
            index = battlegroundArray.index(of: item)!
            battlegroundInBattlegroundArray = true
        }
    }
    
    print(index)
    if battlegroundInBattlegroundArray == true {
        battlegroundArray.remove(at: index)
    } else {
        battlegroundArray.append(battleground)
    }
    
    battlegroundArray = battlegroundArray.sorted(by: {$0.name < $1.name})
    

    
}


func sortHeroes(_ heroArray: inout [Hero]){
    
    heroArray.sort{
        if $0.pickValue != $1.pickValue {//First sort by pickValues
            return $0.pickValue > $1.pickValue
        }
        else {
            //If pickValues are the same, break ties by heroName
            return $0.hero.name < $1.hero.name
        }
    }
}

func getUrlImage(urlString:String, _ callback: @escaping (_ urlImage: Data) -> Void) {
    
    
    let session = URLSession.shared
    let url = URL(string: urlString)
    
    session.dataTask(with: url!, completionHandler: { data, response, error in
        
        guard let responseData = data else { return }
        
        callback(responseData)
        
    }).resume()//Closes Session.dataTaskWithURL
} //Closes parseHeroesData()

func nameToLink(hero: Hero, imageToGet: String) -> String {
    
    func formatName(name: String) -> String {
        var modifiedHeroName = name.lowercased()
        modifiedHeroName = modifiedHeroName.replacingOccurrences(of: " ", with: "-")
        let okayChars : Set<Character> = Set("abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ1234567890-_".characters)
        modifiedHeroName = String(modifiedHeroName.characters.filter {okayChars.contains($0) })
//        modifiedHeroName = modifiedHeroName.replacingOccurrences(of: ",", with: "")
//        modifiedHeroName = modifiedHeroName.replacingOccurrences(of: "'", with: "")
        //modifiedHeroName = "\(modifiedHeroName).png"
        return modifiedHeroName
    }
    
    let name = formatName(name: hero.hero.name)
    
    
    
    func formatTitle(name: String) -> String {
        
        var temp = name.capitalized(with: Locale.current) // capitalize first letter of each word
        temp.replaceSubrange(temp.startIndex...temp.startIndex, with: String(temp[temp.startIndex]).lowercased()) // first letter to lower case
        temp = temp.replacingOccurrences(of: "_", with: "") //replace white spaces doesnt erase them
        temp = String(temp.characters.filter { !" ".characters.contains($0) }) //remove white spaces
        if name == "Greymane" {
            temp = "\(temp)Human"
        }
        //temp = "\(temp)_frame.jpg"
        return temp
        
    }

    let title = formatTitle(name: hero.hero.title)
    
    switch imageToGet {
    case "portrait":
        return "http://www.heroesfire.com/images/wikibase/icon/heroes/\(name).png"
    case "bust":
        return "http://us.battle.net/heroes/static/images/heroes/busts/\(name).jpg"
    case "frame":
        return "http://us.battle.net/heroes/static/images/heroes/skins/frames/\(title)_frame.jpg"
    case "video":
        return "http://media.blizzard.com/heroes/videos/heroes/skins/\(name)_\(title).mp4"
    default:
        return "http://us.battle.net/heroes/static/images/heroes/skills/icons/kharazim_pickYourTrait.png"
    }
    
    
    
}


func removeSpecialCharsFromString(_ text: String) -> String {
    
    let okayChars : Set<Character> = Set("1234567890.".characters)
    return String(text.characters.filter {okayChars.contains($0) })
    
}

func handleJsonErrors(_ text: AnyObject?, type: String) -> Any {
    
    switch type {
    case "string":
        if let temp = text {
            var dummy = temp as! String
            if dummy == "" { dummy = "Value for Key is Empty"}
            return dummy
        } else {
            return "No Key Exists"
        }
    case "int":
        if let temp = text {
            var dummy = removeSpecialCharsFromString(temp as! String)
            if dummy == ""{ dummy = "0"}
            return Int(dummy)!
        } else {
            return 0
        }
    case "double":
        if let temp = text {
            var dummy = removeSpecialCharsFromString(temp as! String)
            if dummy == ""{ dummy = "0.0"}
            return Double(dummy)!
        } else {
            return 0.9
        }
    default:
        return 0.0
    }
    
}



func findStrong(_ heroArray: [Hero], heroToFilter: Hero, increment: Double){
    let heroesWithStrong = heroArray.filter( { $0.strong.contains(heroToFilter) } )
    for hero in heroesWithStrong{
        hero.pickValue = hero.pickValue + increment
        
    }
}

func findWeak(_ heroArray: [Hero], heroToFilter: Hero, increment: Double){
    let heroesWithWeak = heroArray.filter( { $0.weak.contains(heroToFilter) } )
    for hero in heroesWithWeak{
        hero.pickValue = hero.pickValue + increment
        
    }
}

//func findWeak(heroArray: [Hero], heroToFilter: String, increment: Int){
//    let heroesWithWeak = heroArray.filter( { $0.weak.contains("\(heroToFilter)") } )
//    for hero in heroesWithWeak{
//        hero.pickValue = hero.pickValue + increment
//        
//    }
//}


func findHeroToRemove(_ heroArray: inout [Hero], heroToFilter: String){
    
    //var heroToRemove = heroArray
    let indexOfHeroToRemove = heroArray.index(where: {$0.hero.name.contains("\(heroToFilter)") } )
    //print(indexOfHeroToRemove)
    heroArray.remove(at: indexOfHeroToRemove!)
    
    
}


func findBattlegroundSynergy(_ heroArray: [Hero], battlegroundToFilter: [Hero], increment: Double){
    print("called Battleground Synergy")
//    let heroesWithSynergy = heroArray.filter( { $0.map.contains(battlegroundToFilter) } ) // this is the problem // maybe not a problem anymore?
////    print(heroesWithSynergy)
////    print(battlegroundToFilter)
//    for hero in heroesWithSynergy{
//        //print(hero.hero.name)
//        hero.pickValue = hero.pickValue + increment
//        
//    }
    
    for heroWithSynergy in battlegroundToFilter{
        for hero in heroArray{
            if heroWithSynergy.hero.name == hero.hero.name{
                hero.pickValue = hero.pickValue + increment
            }
        }
    }

}

func checkHeroRotation(_ callback: @escaping (_ heroesArrayFromParse: [String]) -> Void) {
    
    
    
    let urlString = "https://www.parsehub.com/api/v2/projects/\(freeHeroRotationProject)/last_ready_run/data?api_key=t4bm23r0ByoX"
    let session = URLSession.shared
    let url = URL(string: urlString)!
    
    session.dataTask(with: url, completionHandler: { data, response, error in
        
        guard let responseData = data else { return }
        var json: [String: [[String: String]]]!
        
        do {
            json = try JSONSerialization.jsonObject(with: responseData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: [[String: String]]]
            print("sucessfully got JSON")
        }
        catch {
            print("error reading JSON")
        }
        
        var arrayToReturn = [String]()
        
        for item in json["freeHeroRotation"]! {
            
            print(item["name"])
            arrayToReturn.append(item["name"]!)
        }
    
    callback(arrayToReturn)
    }).resume()//Closes Session.dataTaskWithURL
} //Closes parseHeroesData()

func updateHeroRotation(stringOfFreeHeroes: [String]) {
    
    func checkForDuplicateFreeHero(hero: Hero, freeHeroRotation: [Hero]) -> Bool {
        for item in freeHeroRotation {
            if hero.hero.name == item.hero.name {
                return true
            }
        }
        return false
    }
    
    for hero in heroes {
        
        for item in stringOfFreeHeroes {
            if hero.hero.name == item && checkForDuplicateFreeHero(hero: hero, freeHeroRotation: freeHeroRotation) == false {
                hero.inFreeHeroRotation = true
                freeHeroRotation.append(hero)
                break
            } else {
                hero.inFreeHeroRotation = false
            }
        }
    }
}







//func loadHeroes(){
//
//
//    switch (userProfile) {
//
//    case "Default":
//        if let loadedHeroes = NSUserDefaults.standardUserDefaults().objectForKey("heroesOriginal") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//
//            print("user is using default heroes")
//            heroes = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedHeroes) as? [Hero])! // unarchive it from data to what it used to be
//        }
//    case "Custom":
//        if let loadedHeroes = NSUserDefaults.standardUserDefaults().objectForKey("heroesCustom") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//
//            print("user has customized heroes")
//            heroes = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedHeroes) as? [Hero])! // unarchive it from data to what it used to be
//        }
//
//
//    default:
//        createHeroes()
//    }
//
//
//    if let loadedHeroes = NSUserDefaults.standardUserDefaults().objectForKey("heroesCustom") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//
//        print("user has customized heroes")
//        heroes = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedHeroes) as? [Hero])! // unarchive it from data to what it used to be
//
//
//    } else if let loadedHeroes = NSUserDefaults.standardUserDefaults().objectForKey("heroesOriginal") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//
//        print("user is using default heroes")
//        heroes = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedHeroes) as? [Hero])! // unarchive it from data to what it used to be
//
//
//    } else { //program has not been run for first time so initialize all premade heroes and add them to parsed JSON
//        appendHeroes()
//        //loadBattlegrounds()
//        parseHeroesData { heroesArrayFromParse in             //Do stuff after parse
//
//            heroes = heroesArrayFromParse
//
//
//            addPremadeHeroToHero()
//
//            //heroes = heroesOriginal.clone()
//            let heroesData = NSKeyedArchiver.archivedDataWithRootObject(heroes) //convert to data
//            NSUserDefaults.standardUserDefaults().setObject(heroesData, forKey: "heroesOriginal") // required for array's / dicts
//            NSUserDefaults.standardUserDefaults().synchronize() // actual saving
//            print("created heroesOriginal and clone it to heroes")
//
//
//
//        }
//
//
//    }
//
//    heroes =  heroes.sort({ $0.hero.name < $1.hero.name }) // consider doing this before saving so on load its sorted
//}

//func fillHeroesIntoArray(heroToSearch: Hero){
//
//    print("filled Heroes into Array")
//
//    var heroesInSynergy = [Hero]()
//    var heroesInStrong = [Hero]()
//    var heroesInWeak = [Hero]()
//    var battlegroundsInHero = [Battleground]()
//
//
//
//    for hero in heroes{
//        for item in heroToSearch.synergy{
//            if hero.hero.name == item {
//                heroesInSynergy.append(hero)
//            }
//        }
//    }
//    for hero in heroes{
//        for item in heroToSearch.strong{
//            if hero.hero.name == item {
//                heroesInStrong.append(hero)
//            }
//        }
//    }
//    for hero in heroes{
//        for item in heroToSearch.weak{
//            if hero.hero.name == item {
//                heroesInWeak.append(hero)
//            }
//        }
//    }
//    for map in battlegrounds{
//        for item in heroToSearch.map{
//            if map.name == item {
//                battlegroundsInHero.append(map)
//            }
//        }
//    }
//
//
//}

//func loadBattlegrounds(){
//
//
//    if let loadedBattlegrounds = NSUserDefaults.standardUserDefaults().objectForKey("battlegrounds") as? NSData {//grab data out of NSUserDefaults and convert it to NSData
//        print("battlegrounds loaded from NSUserDefaults")
//        battlegrounds = (NSKeyedUnarchiver.unarchiveObjectWithData(loadedBattlegrounds) as? [Battleground])! // unarchive it from data to what it used to be
//        //print(battlegrounds)
//        for item in battlegrounds{
//            print(item.synergy)
//            for element in item.synergy {
//                print("\(item.name) AND \(element.hero.name)")
//            }
//        }//check battlegrounds stored correctly
//
//    } else {
//        appendBattlegrounds()
//        let battlegroundsData = NSKeyedArchiver.archivedDataWithRootObject(battlegrounds) //convert to data
//        NSUserDefaults.standardUserDefaults().setObject(battlegroundsData, forKey: "battlegrounds") // required for array's / dicts
//        NSUserDefaults.standardUserDefaults().synchronize() // actual saving
//        print("Created Battlegrounds")
//    }
//    battlegrounds =  battlegrounds.sort({ $0.name < $1.name })
//}
//
//func checkHeroRotation(_ callback: @escaping (_ heroesArrayFromParse: [String]) -> Void) {
//    
//    
//    let bundle = Bundle.main
//    let path = bundle.path(forResource: "freeHeroRotation", ofType: "json")
//    guard let responseData:NSData = try NSData(contentsOfFile: path!) else { return }
//    
//    var json: [String: [[String: String]]]!
//    
//    do {
//        json = try JSONSerialization.jsonObject(with: responseData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: [[String: String]]]
//        print("sucessfully got JSON")
//    }
//    catch {
//        print("error reading JSON")
//    }
//    
//    var arrayToReturn = [String]()
//    
//    for item in json["freeHeroRotation"]! {
//        
//        print(item["name"])
//        arrayToReturn.append(item["name"]!)
//    }
//    
//    
//    callback(arrayToReturn)
//    
//    //print("outside of resume \(heroes)")
//} //Closes parseHeroesData()

