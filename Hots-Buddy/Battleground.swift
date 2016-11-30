//
//  Battleground.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/17/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation

class Battleground : NSObject, NSCoding { // Must inherit NSObject and implement NSCoding protocol
    
    var name: String
    var events: [[String]]
    var timers: [String]
    var tips: [String]
    var synergy: [Hero]
    var size: [String]
    var tags: [String]
    //var imgName: String
    var pickValue = 0
    
    
    init(name: String, events: [[String]], timers: [String], tips: [String], synergy: [Hero], size:[String], tags: [String]){
        self.name = name
        self.events = events
        self.timers = timers
        self.tips = tips
        self.synergy = synergy
        self.size = size
        self.tags = tags
        super.init()
        //self.imgName = imgName
    }
    
    

    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let events = aDecoder.decodeObject(forKey: "events") as! [[String]]
        let timers = aDecoder.decodeObject(forKey: "timers") as! [String]
        let tips = aDecoder.decodeObject(forKey: "tips") as! [String]
        let synergy = aDecoder.decodeObject(forKey: "synergy") as! [Hero]
        let size = aDecoder.decodeObject(forKey: "size") as! [String]
        let tags = aDecoder.decodeObject(forKey: "tags") as! [String]
        self.init(name: name, events: events, timers: timers, tips: tips, synergy: synergy, size: size, tags: tags)
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.events, forKey: "events")
        aCoder.encode(self.timers, forKey: "timers")
        aCoder.encode(self.tips, forKey: "tips")
        aCoder.encode(self.synergy, forKey: "synergy")
        aCoder.encode(self.size, forKey: "size")
        aCoder.encode(self.tags, forKey: "tags")
    }
    
    
}


//add battleground image for predraft, then add map for Battlegrounds


var battlefieldOfEternity = Battleground(name: "Battlefield of Eternity", events: [["Battlefield of Eternity Event1", "Engage in Immortal Combat", "Two Immortals fight at the center of the map. Help your Immortal prevail, and lay waste to the enemy’s Forts."], ["Battlefield of Eternity Event2", "Employ Eternal Tactics", "Protect your Immortal by obliterating the opposing team, or descend upon the enemy Immortal with relentless fury."], ["Battlefield of Eternity Event3", "Hire Unique Mercenaries", "Bolster your forces with Fallen Shaman and cunning Impalers, who will lend their powers to your cause!"]], timers: ["123", "1234"], tips: ["123", "1234"], synergy: [], size: [], tags: [])
var blackheartsBay = Battleground(name: "Blackheart's Bay", events: [["Blackheart's Bay Event1", "Collect Doubloons", "Attack treasure chests, mercenaries, and skeletons to collect doubloons."], ["Blackheart's Bay Event2", "Turn in Doubloons", "Hand your doubloons over to Blackheart or you will drop them all when you die!"], ["Blackheart's Bay Event3", "Bombard Your Enemies", "After receiving enough doubloons from your team, Blackheart will bombard your enemy's forts!"]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var braxisHoldout = Battleground(name: "Braxis Holdout", events: [["Braxis Holdout Event1", "Capture the Beacons", "Periodically two beacons will activate. Capture both to fill your Holding Cell with Zerg."], ["Braxis Holdout Event2", "Fill Holding Cells", "Once either Holding Cell fills, both open and unleash waves of Zerg at each team's base."], ["Braxis Holdout Event3", "Zerg Waves", "Hold out against the enemy's Zerg while helping yours. The Zerg will attack Heroes, so engage cautiously."]], timers: ["testing timers"], tips: ["testing tips"], synergy: [], size: [], tags: [])
var cursedHollow = Battleground(name: "Cursed Hollow", events: [["Cursed Hollow Event1", "Collect Tributes", "The Raven Lord will periodically create tributes. Gather them for your team!"], ["Cursed Hollow Event2", "Curse Your Enemies", "Upon capturing three tributes, the Raven Lord will curse your enemies."], ["Cursed Hollow Event3", "Cursed Forts and Minions", "Cursed forts will not attack, and cursed minions are reduced to 1 health."]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var dragonShire = Battleground(name: "Dragon Shire", events: [["Dragon Shire Event1", "Control the Shrines", "There are two shrines your team needs to control to activate the Dragon Knight's statue."], ["Dragon Shire Event2", "Free the Dragon Knight", "While activated, bring a hero to the statue to free the Dragon Knight from his prison!"], ["Dragon Shire Event3", "Devastate Enemy Forts", "Use the Dragon Knight's immense power to level enemy forts!"]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var gardenOfTerror = Battleground(name: "Garden of Terror", events: [["Garden of Terror Event1", "Fight the Shamblers", "At night, Shamblers will rise from the gardens."], ["Garden of Terror Event2", "Collect Seeds", "Kill the Shamblers and collect seeds for your team."], ["Garden of Terror Event1", "Control Garden Terror", "With 100 seeds, control a garden terror and destroy your enemies!"]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var hauntedMines = Battleground(name: "Haunted Mines", events: [["Haunted Mines Event1", "Venture Underground", "The Haunted Mines will periodically open with an undead army underneath."], ["Haunted Mines Event1","Collect the Skulls", "Destroy the undead and collect their skulls to power your golems!"], ["Haunted Mines Event3", "Unleash the Golems", "After the army has been defeated, the golems will arise for both teams. The more skulls your team collects, the stronger your golem!"]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var infernalShrines = Battleground(name: "Infernal Shrines", events: [["Infernal Shrines Event1", "Activate the Shrines", "The Infernal Shrines periodically gather power. Activate them and prepare for a fight."], ["Infernal Shrines Event2", "Defeat Guardians", "Slay 30 Guardians before the enemy team to bring forth a mighty Punisher."], ["Infernal Shrines Event3", "Beware the Punisher", "Punishers have one of three devastating powers. Be careful, they focus on attacking heroes above all else."]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var skyTemple = Battleground(name: "Sky Temple", events: [["Sky Temple Event1", "Capture the Temples", "Temples will periodically awaken. Stand within their grounds to capture their power!"], ["Sky Temple Event2", "Hold the Temples", "Remain firm and the temple will unleash a blistering onslaught on your enemy's forts!"], ["Sky Temple Event3", "Defend the Temples", "Guardians will try to wrest control of their temples from your team. Hold them off to keep the temple's power for yourselves!"]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var tombOfTheSpiderQueen = Battleground(name: "Tomb of the Spider Queen", events: [["Tomb of the Spider Queen Event1", "Collect Gems", "Enemy spider minions and Heroes drop magical gems upon death. Gather as many as you can!"], ["Tomb of the Spider Queen Event2", "Turn in Gems", "Relinquish your gems at one of the Spider Queen’s altars or you will drop them all when you die!"], ["Tomb of the Spider Queen Event3", "Summon Webweavers", "Whichever team turns in enough gems first will unleash the Webweavers to destroy their enemy’s defenses."]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var towersOfDoom = Battleground(name: "Towers of Doom", events: [["Towers of Doom Event1", "Protected Cores", "Both Cores are protected by a barrier that cannot be attacked by Heroes. To be victorious, you must activate Altars."], ["Towers of Doom Event2", "Activate Altars", "Periodically Altars will rise across the battlefield. Activate them to have your Bell Towers fire upon the enemy’s Core."], ["Towers of Doom Event3", "Claim Bell Towers", "Destory your enemy’s Towers to bring them under your team’s control. The more Towers you have, the more damage an Altar will do."]], timers: [""], tips: [""], synergy: [], size: [], tags: [])
var warheadJunction = Battleground(name: "Warhead Junction", events: [["Warhead Junction Event1", "Warhead Deployment", "Multiple Warheads will spawn periodically across the battleground."], ["Warhead Junction Event2", "Collect Warheads", "Pick up a Warhead to activate your Nuke. Use it or you will drop it when you die!"], ["Warhead Junction Event3", "Call Down the Thunder", "Launch Nukes to devastate the enemy team's fortifications."]], timers: [""], tips: [""], synergy: [], size: [], tags: [])


//var battlefieldOfEternity = Battleground(name: "Battlefield of Eternity", events: [[""]], timers: [""], tips: [""], synergy: ["Greymane", "Jaina", "Johanna", "Kael'thas", "Li-Ming", "Lunara", "Muradin", "Raynor", "Rehgar", "Sgt. Hammer", "Tyrande", "Valla"], size: [], tags: [])
//var blackheartsBay = Battleground(name: "Blackheart's Bay", events: [[""]], timers: [""], tips: [""], synergy: ["E.T.C.", "Falstad", "Illidan", "Johanna", "Muradin", "Rehgar", "Sonya", "Thrall", "Tracer", "Tyrande", "Valla", "Xul", "Zagara", "Zeratul"], size: [], tags: [])
//var cursedHollow = Battleground(name: "Cursed Hollow", events: [[""]], timers: [""], tips: [""], synergy: ["Abathur", "Brightwing", "Dehaka", "E.T.C.", "Falstad", "Kael'thas", "Li-Ming", "Nazeebo", "The Lost Vikings", "Tyrande", "Valla", "Zeratul"], size: [], tags: [])
//var dragonShire = Battleground(name: "Dragon Shire", events: [[""]], timers: [""], tips: [""], synergy: ["Anub'arak", "Brightwing", "Dehaka", "Falstad", "Gazlowe", "Johanna", "Leoric", "Nazeebo", "Rehgar", "Thrall", "Xul", "Zagara", "Zeratul"], size: [], tags: [])
//var gardenOfTerror = Battleground(name: "Garden of Terror", events: [[""]], timers: [""], tips: [""], synergy: ["Abathur", "Anub'arak", "Greymane", "Johanna", "Kael'thas", "Murky", "Rehgar", "Sylvanas", "The Lost Vikings", "Valla", "Zeratul"], size: [], tags: [])
//var hauntedMines = Battleground(name: "Haunted Mines", events: [[""]], timers: [""], tips: [""], synergy: ["Arthas", "E.T.C.", "Jaina", "Johanna", "Kerrigan", "Leoric", "Sylvanas", "Tassadar"], size: [], tags: [])
//var infernalShrines = Battleground(name: "Infernal Shrines", events: [[""]], timers: [""], tips: [""], synergy: ["Arthas", "Diablo", "Gazlowe", "Jaina", "Johanna", "Kael'thas", "Kerrigan", "Leoric", "Nazeebo", "Rehgar", "Sgt. Hammer", "Sonya", "Sylvanas", "Valla", "Xul"], size: [], tags: [])
//var skyTemple = Battleground(name: "Sky Temple", events: [[""]], timers: [""], tips: [""], synergy: ["Abathur", "Anub'arak", "Brightwing", "Falstad", "Gazlowe", "Kael'thas", "Li-Ming", "Murky", "Nazeebo", "Rehgar", "The Lost Vikings", "Zagara"], size: [], tags: [])
//var tombOfTheSpiderQueen = Battleground(name: "Tomb of the Spider Queen", events: [[""]], timers: [""], tips: [""], synergy: ["Azmodan", "Diablo", "Jaina", "Johanna", "Kael'thas", "Kerrigan", "Nazeebo", "Raynor", "Sonya", "Sylvanas", "Tassadar", "Valla", "Xul", "Zagara", "Zeratul"], size: [], tags: [])
//var towersOfDoom = Battleground(name: "Towers of Doom", events: [[""]], timers: [""], tips: [""], synergy: ["Chromie", "Dehaka", "E.T.C.", "Falstad", "Johanna", "Sylvanas", "Thrall", "Xul", "Zagara"], size: [], tags: [])
