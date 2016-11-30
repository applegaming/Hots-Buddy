//
//  Hero.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 8/2/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation




class PremadeHero : NSObject, NSCoding { // Must inherit NSObject and implement NSCoding protocol
    
    var name: String!
    var role: String!
    var synergy: [String]!
    var strong: [String]!
    var weak: [String]!
    var map: [String]!
    var tags: [String]!
    //var imgName: String
    var pickValue = 0

    
    init(name: String, role: String, synergy: [String], strong: [String], weak: [String], map:[String], tags: [String]){
        self.name = name
        self.role = role
        self.synergy = synergy
        self.strong = strong
        self.weak = weak
        self.map = map
        self.tags = tags
        //self.imgName = imgName
    }
    
        
    override init() {
        //must be empty initializer
    }
    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        self.init()
        self.name = aDecoder.decodeObject(forKey: "name") as? String
        self.role = aDecoder.decodeObject(forKey: "role") as? String
        self.synergy = aDecoder.decodeObject(forKey: "synergy") as? Array
        self.strong = aDecoder.decodeObject(forKey: "strong") as? Array
        self.weak = aDecoder.decodeObject(forKey: "weak") as? Array
        self.map = aDecoder.decodeObject(forKey: "map") as? Array
        self.tags = aDecoder.decodeObject(forKey: "tags") as? Array
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.role, forKey: "role")
        aCoder.encode(self.synergy, forKey: "synergy")
        aCoder.encode(self.strong, forKey: "strong")
        aCoder.encode(self.weak, forKey: "weak")
        aCoder.encode(self.map, forKey: "map")
        aCoder.encode(self.tags, forKey: "tags")
    }
    
    
}



var abathur = PremadeHero(name: "Abathur", role: "Melee Specialist", synergy: ["Illidan", "Butcher", "Kerrigan", "Greymane", "Thrall", "Artanis", "Sonya", "Zeratul", "Tyrael", "Chen", "Leoric", "Johanna", "Murky", "Anub'arak"], strong: ["Murky", "Tracer"], weak: ["Zeratul", "Dehaka", "Nova", "Azmodan", "Tyrande", "Medivh"], map: ["Cursed Hollow", "Garden of Terror", "Sky Temple"], tags: [])
var anubArak = PremadeHero(name: "Anub'arak", role: "Melee Warrior", synergy: ["Abathur", "Jaina", "Kael'thas", "Kerrigan", "Rehgar", "Butcher", "Tyrael"], strong: ["Li Li", "Lt. Morales", "Chen", "Chromie", "Nazeebo", "Nova", "Malfurion", "E.T.C.", "Cho", "Gall"], weak: ["Sonya", "Valla"], map: ["Garden of Terror", "Dragon Shire", "Sky Temple"], tags: [])
var artanis = PremadeHero(name: "Artanis", role: "Melee Warrior", synergy: ["Tassadar", "Abathur", "Malfurion", "Lt. Morales"], strong: ["Sgt. Hammer", "Zeratul", "Nova", "Lt. Morales"], weak: ["Brightwing", "Uther"], map: [], tags: [])
var arthas = PremadeHero(name: "Arthas", role: "Melee Warrior", synergy: ["Jaina", "Raynor", "Tyrande", "Kerrigan", "Lunara", "Kael'thas", "Valla", "Thrall"], strong: ["Zeratul", "Nova"], weak: ["Leoric", "Tracer"], map: ["Haunted Mines", "Infernal Shrines"], tags: [])
var azmodan = PremadeHero(name: "Azmodan", role: "Ranged Specialist", synergy: ["Johanna"], strong: ["Abathur"], weak: ["Chen", "Leoric", "Butcher", "Sonya"], map: ["Tomb of the Spider Queen"], tags: [])
var brightwing = PremadeHero(name: "Brightwing", role: "Ranged Support", synergy: ["The Lost Vikings", "Valla", "Dehaka", "Falstad"], strong: ["Illidan", "Tracer", "E.T.C.", "Cho", "Gall", "Sonya", "Butcher", "Chen", "Artanis", "Thrall", "Greymane"], weak: ["Jaina"], map: ["Dragon Shire", "Cursed Hollow", "Sky Temple"], tags: [])
var chen = PremadeHero(name: "Chen", role: "Melee Warrior", synergy: ["Abathur", "Rehgar", "Kharazim", "Li Li"], strong: ["Lunara", "Nova", "Zeratul", "Li-Ming", "Lt. Morales"], weak: ["E.T.C.", "Uther", "Muradin", "Anub'arak", "Brightwing", "Tyrande"], map: [], tags: [])
var cho = PremadeHero(name: "Cho", role: "Melee Warrior", synergy: ["Lt. Morales", "Rehgar", "Uther"], strong: ["Zeratul", "Nova", "Lt. Morales"], weak: ["Leoric", "Kharazim", "Raynor", "Brightwing", "Butcher", "Anub'arak"], map: [], tags: [])
var chromie = PremadeHero(name: "Chromie", role: "Ranged Assassin", synergy: ["Xul", "E.T.C.", "Malfurion", "Jaina", "Murky"], strong: ["Sgt. Hammer"], weak: ["Zeratul", "Greymane", "Tracer", "Nova", "Illidan", "Kerrigan", "Butcher", "Thrall", "Anub'arak", "Lunara", "Falstad", "Stitches"], map: ["Towers of Doom"], tags: [])
var dehaka = PremadeHero(name: "Dehaka", role: "", synergy: ["Xul", "Brightwing"], strong: ["Abathur", "Lt. Morales"], weak: ["Tychus", "Lunara"], map: ["Dragon Shire", "Towers of Doom", "Cursed Hollow"], tags: [])
var diablo = PremadeHero(name: "Diablo", role: "Melee Warrior", synergy: ["Tyrande", "Rehgar", "Uther", "Zeratul", "Valla", "Greymane", "Li-Ming"], strong: ["Lt. Morales", "Nova", "Sgt. Hammer", "Nazeebo"], weak: ["Leoric"], map: ["Tomb of the Spider Queen", "Infernal Shrines"], tags: [])
var etc = PremadeHero(name: "E.T.C.", role: "Melee Warrior", synergy: ["Kael'thas", "Valla", "Jaina", "Li-Ming", "Rehgar", "Nazeebo", "Chromie", "Sgt. Hammer", "Butcher", "Gazlowe", "Falstad", "Tychus", "Nova", "Zagara", "Illidan", "Greymane", "Kharazim"], strong: ["Chen", "Li Li", "Illidan", "Nova", "Zeratul"], weak: ["Brightwing", "Tyrande", "Falstad", "Raynor", "Johanna", "Anub'arak"], map: ["Cursed Hollow", "Blackheart's Bay", "Haunted Mines", "Towers of Doom"], tags: [])
var falstad = PremadeHero(name: "Falstad", role: "Ranged Assassin", synergy: ["E.T.C.", "Tyrael", "Brightwing"], strong: ["E.T.C.", "Sylvanas", "Chromie", "Leoric", "Jaina"], weak: ["Zeratul", "Nova"], map: ["Dragon Shire", "Cursed Hollow", "Sky Temple", "Blackheart's Bay", "Towers of Doom"], tags: [])
var gall = PremadeHero(name: "Gall", role: "Ranged Assassin", synergy: ["Lt. Morales", "Rehgar", "Uther"], strong: ["Zeratul", "Nova", "Lt. Morales"], weak: ["Leoric", "Kharazim", "Raynor", "Brightwing", "Butcher", "Anub'arak"], map: [], tags: [])
var gazlowe = PremadeHero(name: "Gazlowe", role: "Melee Specialist", synergy: ["E.T.C."], strong: [], weak: ["Kael'thas", "Greymane"], map: ["Dragon Shire", "Sky Temple", "Infernal Shrines"], tags: [])
var greymane = PremadeHero(name: "Greymane", role: "Ranged Assassin", synergy: ["Abathur", "Tassadar", "Lt. Morales", "Rehgar", "Tyrande", "E.T.C.", "Diablo"], strong: ["Chromie", "Jaina", "Li-Ming", "Valla", "Gul'dan", "Lt. Morales", "Gazlowe", "Lunara"], weak: ["Butcher", "Xul", "Brightwing"], map: ["Battlefield of Eternity", "Garden of Terror"], tags: [])
var gulDan = PremadeHero(name: "Gul'dan", role: "Ranged Assassin", synergy: ["Malfurion", "Lt. Morales"], strong: [], weak: ["Greymane"], map: [], tags: [])
var illidan = PremadeHero(name: "Illidan", role: "Melee Assassin", synergy: ["Abathur", "Rehgar", "Tassadar", "Uther", "Lt. Morales", "Kharazim", "Medivh", "Li Li", "E.T.C.", "Tyrande"], strong: ["Chromie", "Lt. Morales", "Nazeebo", "Tyrande", "Valla", "Li-Ming", "Jaina", "Nova", "Kael'thas", "Malfurion", "Rexxar", "Raynor", "Lunara"], weak: ["Brightwing", "Xul", "Uther", "Muradin", "Johanna", "Li Li", "Sonya", "E.T.C.", "Tychus", "Artanis"], map: ["Blackheart's Bay"], tags: [])
var jaina = PremadeHero(name: "Jaina", role: "Ranged Assassin", synergy: ["Johanna", "E.T.C.", "Xul", "Malfurion", "Nazeebo", "Arthas", "Butcher", "Tyrande", "Anub'arak", "Kerrigan", "Kael'thas", "Zeratul", "Chromie", "Raynor"], strong: ["Malfurion", "Sgt. Hammer", "The Lost Vikings", "Xul", "Brightwing"], weak: ["Tracer", "Greymane", "Zeratul", "Nova", "Tyrael", "Kerrigan", "Lunara", "Illidan", "Muradin", "Falstad"], map: ["Infernal Shrines", "Tomb of the Spider Queen", "Haunted Mines", "Battlefield of Eternity"], tags: [])
var johanna = PremadeHero(name: "Johanna", role: "Melee Warrior", synergy: ["Jaina", "Kael'thas", "Li-Ming", "Nazeebo", "Azmodan", "Malfurion", "Kerrigan", "Abathur", "Rehgar", "Butcher"], strong: ["Nova", "Zeratul", "Illidan", "Xul", "Thrall", "Butcher", "Li Li", "E.T.C."], weak: ["Leoric"], map: ["Tomb of the Spider Queen", "Infernal Shrines", "Garden of Terror", "Battlefield of Eternity", "Towers of Doom", "Haunted Mines", "Blackheart's Bay", "Dragon Shire"], tags: [])
var kaelThas = PremadeHero(name: "Kael'thas", role: "Ranged Assassin", synergy: ["E.T.C.", "Johanna", "Muradin", "Malfurion", "Jaina", "Uther", "Arthas", "Tyrande", "Zeratul", "Butcher", "Anub'arak"], strong: ["The Lost Vikings", "Gazlowe", "Sgt. Hammer"], weak: ["Tyrael", "Nova", "Zeratul", "Kerrigan", "Butcher", "Illidan", "Muradin"], map: ["Infernal Shrines", "Tomb of the Spider Queen", "Cursed Hollow", "Battlefield of Eternity", "Sky Temple", "Garden of Terror"], tags: [])
var kerrigan = PremadeHero(name: "Kerrigan", role: "Melee Assassin", synergy: ["Tyrande", "Abathur", "Uther", "Tassadar", "Xul", "Anub'arak", "Arthas", "Jaina", "Johanna", "Kharazim", "Muradin", "Rehgar"], strong: ["Chromie", "Kael'thas", "Lt. Morales", "Jaina", "Tyrande", "Sgt. Hammer", "Zagara"], weak: ["Uther", "Muradin", "Sonya"], map: ["Tomb of the Spider Queen", "Infernal Shrines", "Haunted Mines"], tags: [])
var kharazim = PremadeHero(name: "Kharazim", role: "Melee Support", synergy: ["Illidan", "Tyrael", "Butcher", "Chen", "Kerrigan", "Thrall", "E.T.C."], strong: ["Cho", "Gall", "Zeratul", "Stitches"], weak: ["Li Li", "Xul"], map: [], tags: [])
var leoric = PremadeHero(name: "Leoric", role: "Melee Warrior", synergy: ["Abathur", "Nazeebo"], strong: ["Cho", "Gall", "Stitches", "Diablo", "Muradin", "Arthas", "Johanna", "Azmodan", "Tyrael"], weak: ["Raynor", "Tracer", "Valla", "Falstad"], map: ["Infernal Shrines", "Haunted Mines", "Dragon Shire"], tags: [])
var lili = PremadeHero(name: "Li Li", role: "Ranged Support", synergy: ["Valla", "Illidan", "Raynor", "Tyrael", "Chen", "Tychus"], strong: ["Illidan", "Thrall", "Tracer", "Butcher", "Kharazim", "Raynor"], weak: ["Anub'arak", "Muradin", "E.T.C.", "Johanna"], map: [], tags: [])
var liMing = PremadeHero(name: "Li-Ming", role: "Ranged Assassin", synergy: ["E.T.C.", "Xul", "Johanna", "Malfurion", "Rehgar", "Diablo"], strong: ["Sgt. Hammer", "The Lost Vikings", "Murky", "Malfurion"], weak: ["Tracer", "Greymane", "Zeratul", "Illidan", "Butcher", "Chen"], map: ["Battlefield of Eternity", "Cursed Hollow", "Sky Temple"], tags: [])
var ltMorales = PremadeHero(name: "Lt. Morales", role: "Ranged Support", synergy: ["Raynor", "Butcher", "Sonya", "Sgt. Hammer", "Valla", "Cho", "Gall", "Illidan", "Greymane", "Thrall", "Lunara", "Tychus", "Artanis", "Kerrigan", "Gul'dan"], strong: [], weak: ["Tracer", "Illidan", "Zeratul", "Butcher", "Diablo", "Stitches", "Dehaka", "Kerrigan", "Anub'arak", "Greymane", "Nova", "Tyrael", "Thrall", "Muradin", "Lunara", "Artanis", "Murky", "Cho", "Gall", "Chen"], map: [], tags: [])
var lunara = PremadeHero(name: "Lunara", role: "Ranged Assassin", synergy: ["Arthas", "Lt. Morales", "Tyrande"], strong: ["Uther", "Jaina", "Dehaka", "Chromie", "Lt. Morales"], weak: ["Chen", "Butcher", "Greymane", "Illidan"], map: ["Battlefield of Eternity"], tags: [])
var malfurion = PremadeHero(name: "Malfurion", role: "Ranged Support", synergy: ["Jaina", "Nazeebo", "Li-Ming", "Kael'thas", "Johanna", "Valla", "Chromie", "Stitches", "Gul'dan", "Artanis", "Xul", "Zagara"], strong: [], weak: ["Jaina", "Tracer", "Butcher", "Anub'arak", "Illidan", "Tyrael", "Thrall", "Li-Ming"], map: [], tags: [])
var medivh = PremadeHero(name: "Medivh", role: "Ranged Specialist", synergy: ["Illidan", "Thrall", "Sonya", "Butcher"], strong: ["Abathur"], weak: [], map: [], tags: [])
var muradin = PremadeHero(name: "Muradin", role: "Melee Warrior", synergy: ["Kael'thas", "Tyrande", "Kerrigan", "Abathur"], strong: ["Zeratul", "Illidan", "Nova", "Chen", "Kerrigan", "Butcher", "Li Li", "Lt. Morales", "Jaina", "Kael'thas"], weak: ["Leoric"], map: ["Battlefield of Eternity", "Blackheart's Bay"], tags: [])
var murky = PremadeHero(name: "Murky", role: "Melee Specialist", synergy: ["Tassadar", "Abathur", "Chromie"], strong: ["Lt. Morales"], weak: ["Tracer", "Tychus", "Li-Ming", "Nova", "Zeratul", "Valla"], map: ["Garden of Terror", "Sky Temple"], tags: [])
var nazeebo = PremadeHero(name: "Nazeebo", role: "Ranged Specialist", synergy: ["Jaina", "Malfurion", "E.T.C.", "Johanna", "Sylvanas", "Leoric"], strong: ["Sgt. Hammer"], weak: ["Illidan", "Sonya", "Zeratul", "Anub'arak", "Sylvanas", "Diablo"], map: ["Cursed Hollow", "Tomb of the Spider Queen", "Sky Temple", "Dragon Shire", "Infernal Shrines"], tags: [])
var nova = PremadeHero(name: "Nova", role: "Ranged Assassin", synergy: ["Tyrande", "E.T.C."], strong: ["Chromie", "Sylvanas", "Kael'thas", "Abathur", "Jaina", "Valla", "Lt. Morales", "Sgt. Hammer", "Murky", "Falstad", "Zagara", "The Lost Vikings"], weak: ["Tassadar", "Johanna", "Tyrael", "Muradin", "Arthas", "Chen", "Cho", "Gall", "Butcher", "Diablo", "Illidan", "Artanis", "E.T.C.", "Anub'arak", "Zeratul"], map: [], tags: [])
var raynor = PremadeHero(name: "Raynor", role: "Ranged Assassin", synergy: ["Lt. Morales", "Arthas", "Li Li", "Thrall", "Jaina"], strong: ["Cho", "Gall", "Leoric", "Tracer", "E.T.C.", "Valla", "Sylvanas"], weak: ["Illidan", "Li Li"], map: ["Battlefield of Eternity", "Tomb of the Spider Queen"], tags: [])
var rehgar = PremadeHero(name: "Rehgar", role: "Melee Support", synergy: ["Illidan", "Thrall", "E.T.C.", "Diablo", "Sonya", "Cho", "Gall", "Chen", "Anub'arak", "Greymane", "Butcher", "Tyrael", "Li-Ming", "Johanna", "Kerrigan"], strong: [], weak: [], map: ["Dragon Shire", "Blackheart's Bay", "Garden of Terror", "Battlefield of Eternity", "Sky Temple", "Infernal Shrines"], tags: [])
var rexxar = PremadeHero(name: "Rexxar", role: "Ranged Warrior", synergy: [], strong: [], weak: [], map: [], tags: [])
var sgtHammer = PremadeHero(name: "Sgt. Hammer", role: "Ranged Specialist", synergy: ["Lt. Morales", "E.T.C.", "Uther", "Li Li"], strong: [], weak: ["Chromie", "Stitches", "Artanis", "Li-Ming", "Nazeebo", "Jaina", "Butcher", "Zagara", "Nova", "Kael'thas", "Tyrande", "Kerrigan", "Diablo", "Zeratul"], map: ["Battlefield of Eternity", "Infernal Shrines"], tags: [])
var sonya = PremadeHero(name: "Sonya", role: "Melee Assassin", synergy: ["Lt. Morales", "Abathur", "Tassadar", "Rehgar", "Uther", "Medivh"], strong: ["Nazeebo", "Illidan", "Zeratul", "Azmodan", "Kerrigan"], weak: ["Brightwing", "Uther", "Muradin"], map: ["Infernal Shrines", "Tomb of the Spider Queen", "Blackheart's Bay"], tags: [])
var stitches = PremadeHero(name: "Stitches", role: "Melee Warrior", synergy: ["Tyrande", "Malfurion", "Uther"], strong: ["Sgt. Hammer", "Lt. Morales", "Jaina", "Chromie"], weak: ["Leoric", "Kharazim"], map: [], tags: [])
var sylvanas = PremadeHero(name: "Sylvanas", role: "Ranged Specialist", synergy: ["Valla", "Tyrande", "Nazeebo"], strong: ["Nazeebo", "The Lost Vikings"], weak: ["Zeratul", "Nova", "Zagara", "Falstad", "Butcher", "Raynor"], map: ["Haunted Mines", "Tomb of the Spider Queen", "Infernal Shrines", "Garden of Terror", "Towers of Doom"], tags: [])
var tassadar = PremadeHero(name: "Tassadar", role: "Ranged Support", synergy: ["Illidan", "Artanis", "Tracer", "Greymane", "Kerrigan", "Sonya", "Thrall", "Tyrael", "Murky", "Zeratul"], strong: ["Nova", "Zeratul"], weak: [], map: ["Haunted Mines", "Tomb of the Spider Queen"], tags: [])
var theButcher = PremadeHero(name: "Butcher", role: "Melee Assassin", synergy: ["Abathur", "Lt. Morales", "Tyrande", "Uther", "Jaina", "E.T.C.", "Tyrael", "Rehgar", "Anub'arak", "Kharazim", "Kael'thas", "Johanna"], strong: ["Lt. Morales", "Chromie", "Sgt. Hammer", "Greymane", "Nova", "Valla", "Kael'thas", "Malfurion", "Azmodan", "Li-Ming", "Sylvanas", "Lunara"], weak: ["Uther", "Xul", "Brightwing", "Li Li", "Johanna", "Muradin"], map: [], tags: [])
var theLostVikings = PremadeHero(name: "The Lost Vikings", role: "Melee Specialist", synergy: ["Brightwing"], strong: [], weak: ["Kael'thas", "Zeratul", "Li-Ming", "Jaina", "Tracer", "Valla", "Sylvanas"], map: ["Cursed Hollow", "Garden of Terror", "Sky Temple"], tags: [])
var thrall = PremadeHero(name: "Thrall", role: "Melee Assassin", synergy: ["Rehgar", "Abathur", "Lt. Morales", "Tassadar", "Medivh", "Tyrande", "Kharazim"], strong: ["Chromie", "Lt. Morales", "Malfurion", "Zeratul"], weak: ["Johanna", "Li Li", "Xul", "Brightwing"], map: ["Dragon Shire", "Towers of Doom", "Blackheart's Bay"], tags: [])
var tracer = PremadeHero(name: "Tracer", role: "Ranged Assassin", synergy: ["Tassadar"], strong: ["Chromie", "Li-Ming", "Jaina", "Lt. Morales", "Murky", "Malfurion", "Leoric", "Tyrande", "The Lost Vikings", "Arthas"], weak: ["Brightwing", "Li Li", "Raynor"], map: ["Blackheart's Bay"], tags: [])
var tychus = PremadeHero(name: "Tychus", role: "Ranged Assassin", synergy: ["E.T.C.", "Lt. Morales", "Li Li"], strong: ["Murky", "Dehaka", "Illidan"], weak: [], map: [], tags: [])
var tyrael = PremadeHero(name: "Tyrael", role: "Melee Warrior", synergy: ["Anub'arak", "Abathur", "Butcher", "Kharazim", "Tassadar", "Rehgar", "Falstad", "Li Li"], strong: ["Kael'thas", "Nova", "Jaina", "Zeratul", "Lt. Morales", "Valla", "Malfurion"], weak: ["Leoric"], map: [], tags: [])
var tyrande = PremadeHero(name: "Tyrande", role: "Ranged Support", synergy: ["Diablo", "Kerrigan", "Butcher", "Xul", "Muradin", "Jaina", "Nova", "Arthas", "Stitches", "Sylvanas", "Greymane", "Valla", "Kael'thas", "Thrall", "Zeratul", "Lunara", "Illidan"], strong: ["Abathur", "E.T.C.", "Sgt. Hammer", "Chen"], weak: ["Illidan", "Zeratul", "Kerrigan", "Tracer"], map: ["Cursed Hollow", "Blackheart's Bay", "Battlefield of Eternity"], tags: [])
var uther = PremadeHero(name: "Uther", role: "Melee Support", synergy: ["Illidan", "Kerrigan", "Butcher", "Zeratul", "Sonya", "Kael'thas", "Diablo", "Sgt. Hammer", "Stitches", "Valla", "Cho", "Gall"], strong: ["Illidan", "Butcher", "Chen", "Zeratul", "Kerrigan", "Sonya", "Artanis"], weak: ["Lunara"], map: [], tags: [])
var valla = PremadeHero(name: "Valla", role: "Ranged Assassin", synergy: ["E.T.C.", "Lt. Morales", "Sylvanas", "Li Li", "Tyrande", "Malfurion", "Zagara", "Brightwing", "Diablo", "Arthas", "Uther"], strong: ["Leoric", "The Lost Vikings", "Murky"], weak: ["Zeratul", "Greymane", "Nova", "Illidan", "Butcher", "Raynor", "Tyrael"], map: ["Battlefield of Eternity", "Garden of Terror", "Infernal Shrines", "Cursed Hollow", "Tomb of the Spider Queen", "Blackheart's Bay"], tags: [])
var xul = PremadeHero(name: "Xul", role: "Melee Specialist", synergy: ["Chromie", "Dehaka", "Jaina", "Li-Ming", "Tyrande", "Kerrigan", "Malfurion"], strong: ["Illidan", "Butcher", "Thrall", "Greymane", "Kharazim"], weak: ["Johanna", "Jaina", "Tracer"], map: ["Tomb of the Spider Queen", "Infernal Shrines", "Dragon Shire", "Towers of Doom", "Blackheart's Bay"], tags: [])
var zagara = PremadeHero(name: "Zagara", role: "Ranged Specialist", synergy: ["E.T.C.", "Valla", "Zeratul"], strong: ["Sgt. Hammer", "Sylvanas"], weak: ["Zeratul", "Kerrigan", "Nova"], map: ["Tomb of the Spider Queen", "Blackheart's Bay", "Towers of Doom", "Sky Temple", "Dragon Shire"], tags: [])
var zeratul = PremadeHero(name: "Zeratul", role: "Melee Assassin", synergy: ["Abathur", "Uther", "Jaina", "Tassadar", "Diablo", "Tyrande", "Zagara", "Kael'thas"], strong: ["Chromie", "Abathur", "Sylvanas", "Valla", "Kael'thas", "Jaina", "Li-Ming", "The Lost Vikings", "Tyrande", "Nazeebo", "Zagara", "Falstad", "Murky", "Sgt. Hammer", "Nova"], weak: ["Johanna", "Tassadar", "Muradin", "Arthas", "Tyrael", "Uther", "Cho", "Gall", "Chen", "Sonya", "Artanis", "Kharazim", "E.T.C.", "Rehgar", "Thrall", "Brightwing"], map: ["Blackheart's Bay", "Dragon Shire", "Tomb of the Spider Queen", "Cursed Hollow", "Garden of Terror"], tags: [])


//var battlefieldOfEternity = PremadeHero(name: "Battlefield of Eternity", role: "", synergy: ["Greymane", "Jaina", "Johanna", "Kael'thas", "Li-Ming", "Lunara", "Muradin", "Raynor", "Rehgar", "Sgt. Hammer", "Tyrande", "Valla"], strong: [], weak: [], map: [], tags: [])
//var blackheartsBay = PremadeHero(name: "Blackheart's Bay", role: "", synergy: ["E.T.C.", "Falstad", "Illidan", "Johanna", "Muradin", "Rehgar", "Sonya", "Thrall", "Tracer", "Tyrande", "Valla", "Xul", "Zagara", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var cursedHollow = PremadeHero(name: "Cursed Hollow", role: "", synergy: ["Abathur", "Brightwing", "Dehaka", "E.T.C.", "Falstad", "Kael'thas", "Li-Ming", "Nazeebo", "The Lost Vikings", "Tyrande", "Valla", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var dragonShire = PremadeHero(name: "Dragon Shire", role: "", synergy: ["Anub'arak", "Brightwing", "Dehaka", "Falstad", "Gazlowe", "Johanna", "Leoric", "Nazeebo", "Rehgar", "Thrall", "Xul", "Zagara", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var gardenOfTerror = PremadeHero(name: "Garden of Terror", role: "", synergy: ["Abathur", "Anub'arak", "Greymane", "Johanna", "Kael'thas", "Murky", "Rehgar", "Sylvanas", "The Lost Vikings", "Valla", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var hauntedMines = PremadeHero(name: "Haunted Mines", role: "", synergy: ["Arthas", "E.T.C.", "Jaina", "Johanna", "Kerrigan", "Leoric", "Sylvanas", "Tassadar"], strong: [], weak: [], map: [], tags: [])
//var infernalShrines = PremadeHero(name: "Infernal Shrines", role: "", synergy: ["Arthas", "Diablo", "Gazlowe", "Jaina", "Johanna", "Kael'thas", "Kerrigan", "Leoric", "Nazeebo", "Rehgar", "Sgt. Hammer", "Sonya", "Sylvanas", "Valla", "Xul"], strong: [], weak: [], map: [], tags: [])
//var skyTemple = PremadeHero(name: "Sky Temple", role: "", synergy: ["Abathur", "Anub'arak", "Brightwing", "Falstad", "Gazlowe", "Kael'thas", "Li-Ming", "Murky", "Nazeebo", "Rehgar", "The Lost Vikings", "Zagara"], strong: [], weak: [], map: [], tags: [])
//var tombOfTheSpiderQueen = PremadeHero(name: "Tomb of the Spider Queen", role: "", synergy: ["Azmodan", "Diablo", "Jaina", "Johanna", "Kael'thas", "Kerrigan", "Nazeebo", "Raynor", "Sonya", "Sylvanas", "Tassadar", "Valla", "Xul", "Zagara", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var towersOfDoom = PremadeHero(name: "Towers of Doom", role: "", synergy: ["Chromie", "Dehaka", "E.T.C.", "Falstad", "Johanna", "Sylvanas", "Thrall", "Xul", "Zagara"], strong: [], weak: [], map: [], tags: [])





