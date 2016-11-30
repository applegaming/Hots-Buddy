////
////  Hero.swift
////  Hots-Buddy
////
////  Created by Alexander Appugliese on 8/2/16.
////  Copyright © 2016 AppleGaming. All rights reserved.
////
//
//import Foundation
//
////Protocal that copyable class should conform
//protocol Copying {
//    init(original: Self)
//}
//
////Concrete class extension
//extension Copying {
//    func copy() -> Self {
//        return Self.init(original: self)
//    }
//}
//
////Array extension for elements conforms the Copying protocol
//extension Array where Element: Copying {
//    func clone() -> Array {
//        var copiedArray = Array<Element>()
//        for element in self {
//            copiedArray.append(element.copy())
//        }
//        return copiedArray
//    }
//}
//
//
//class Hero : NSObject, Copying, NSCoding { // Must inherit NSObject and implement NSCoding protocol
//    
//    private var _name: String!
//    private var _role: String!
//    private var _synergy: [String]!
//    private var _strong: [String]!
//    private var _weak: [String]!
//    private var _map: [String]!
//    private var _tags: [String]!
//    //private var _imgName: String
//    private var _pickValue = 0
//    
//    var name: String{
//        get {
//            return _name
//        }
//        set(name) {
//            _name = name
//        }
//    }
//    var role: String{
//        get {
//            return _role
//        }
//        set(role) {
//            _role = role
//        }
//    }
//    
//    var synergy: [String]{
//        get {
//            return _synergy
//        }
//        set(synergy) {
//            _synergy = synergy
//        }
//    }
//    var strong: [String]{
//        get {
//            return _strong
//        }
//        set(strong) {
//            _strong = strong
//        }
//    }
//    
//    var weak: [String]{
//        get {
//            return _weak
//        }
//        set(weak) {
//            _weak = weak
//        }
//    }
//    var map: [String]{
//        get {
//            return _map
//        }
//        set(map) {
//            _map = map
//        }
//    }
//    var tags: [String]{
//        get {
//            return _tags
//        }
//        set(tags) {
//            _tags = tags
//        }
//    }
//    //    var imgName: String{
//    //        return _imgName
//    //    }
//    var pickValue: Int{
//        get {
//            return _pickValue
//        }
//        set(pickValue) {
//            _pickValue = pickValue
//        }
//    }
//    
//    
//    
//    
//    
//    init(name: String, role: String, synergy: [String], strong: [String], weak: [String], map:[String], tags: [String]){
//        self._name = name
//        self._role = role
//        self._synergy = synergy
//        self._strong = strong
//        self._weak = weak
//        self._map = map
//        self._tags = tags
//        //self._imgName = imgName
//    }
//    
//    required init(original: Hero) {
//        _name = original.name
//        _role = original.role
//        _synergy = original.synergy
//        _strong = original.strong
//        _weak = original.weak
//        _map = original.map
//        _tags = original.tags
//        // _imgName = original.imgName
//        _pickValue = original.pickValue
//        
//    }
//    
//    override init() {
//        //must be empty initializer
//    }
//    
//    //include all properties you want to store
//    required convenience init?(coder aDecoder: NSCoder) {
//        self.init()
//        self._name = aDecoder.decodeObjectForKey("name") as? String
//        self._role = aDecoder.decodeObjectForKey("role") as? String
//        self._synergy = aDecoder.decodeObjectForKey("synergy") as? Array
//        self._strong = aDecoder.decodeObjectForKey("strong") as? Array
//        self._weak = aDecoder.decodeObjectForKey("weak") as? Array
//        self._map = aDecoder.decodeObjectForKey("map") as? Array
//        self._tags = aDecoder.decodeObjectForKey("tags") as? Array
//    }
//    
//    //include all properties you want to load
//    func encodeWithCoder(aCoder: NSCoder) {
//        
//        aCoder.encodeObject(self._name, forKey: "name")
//        aCoder.encodeObject(self._role, forKey: "role")
//        aCoder.encodeObject(self._synergy, forKey: "synergy")
//        aCoder.encodeObject(self._strong, forKey: "strong")
//        aCoder.encodeObject(self._weak, forKey: "weak")
//        aCoder.encodeObject(self._map, forKey: "map")
//        aCoder.encodeObject(self._tags, forKey: "tags")
//    }
//    
//    
//}
//
//var abathur = Hero(name: "Abathur", role: "Melee Specialist", synergy: ["Illidan", "The Butcher", "Kerrigan", "Greymane", "Thrall", "Artanis", "Sonya", "Zeratul", "Tyreal", "Chen", "Leoric", "Johanna", "Murky", "Anub'arak"], strong: ["Murky", "Tracer"], weak: ["Zeratul", "Dehaka", "Nova", "Azmodan", "Tyrande", "Medivh"], map: ["Cursed Hollow", "Garden of Terror", "Sky Temple"], tags: [])
//var anubArak = Hero(name: "Anub'arak", role: "Melee Warrior", synergy: ["Abathur", "Jaina", "Kael'thas", "Kerrigan", "Rehgar", "The Butcher", "Tyreal"], strong: ["Li Li", "Lt. Morales", "Chen", "Chromie", "Nazeebo", "Nova", "Malfurion", "ETC", "Cho'gall"], weak: ["Sonya", "Valla"], map: ["Garden of Terror", "Dragon Shire", "Sky Temple"], tags: [])
//var artanis = Hero(name: "Artanis", role: "Melee Warrior", synergy: ["Tassadar", "Abathur", "Malfurion", "Lt. Morales"], strong: ["Sgt. Hammer", "Zeratul", "Nova", "Lt. Morales"], weak: ["Brightwing", "Uther"], map: [], tags: [])
//var arthas = Hero(name: "Arthas", role: "Melee Warrior", synergy: ["Jaina", "Raynor", "Tyrande", "Kerrigan", "Lunara", "Kael'thas", "Valla", "Thrall"], strong: ["Zeratul", "Nova"], weak: ["Leoric", "Tracer"], map: ["Haunted Mines", "Infernal Shrines"], tags: [])
//var azmodan = Hero(name: "Azmodan", role: "Ranged Specialist", synergy: ["Johanna"], strong: ["Abathur"], weak: ["Chen", "Leoric", "The Butcher", "Sonya"], map: ["Tomb of the Spider Queen"], tags: [])
//var brightwing = Hero(name: "Brightwing", role: "Ranged Support", synergy: ["The Lost Vikings", "Valla", "Dehaka", "Falstad"], strong: ["Illidan", "Tracer", "ETC", "Cho'gall", "Sonya", "The Butcher", "Chen", "Artanis", "Thrall", "Greymane"], weak: ["Jaina"], map: ["Dragon Shire", "Cursed Hollow", "Sky Temple"], tags: [])
//var chen = Hero(name: "Chen", role: "Melee Warrior", synergy: ["Abathur", "Rehgar", "Kharazim", "Li Li"], strong: ["Lunara", "Nova", "Zeratul", "Li-Ming", "Lt. Morales"], weak: ["ETC", "Uther", "Muradin", "Anub'arak", "Brightwing", "Tyrande"], map: [], tags: [])
//var cho = Hero(name: "Cho", role: "Melee Warrior", synergy: ["Lt. Morales", "Rehgar", "Uther"], strong: ["Zeratul", "Nova", "Lt. Morales"], weak: ["Leoric", "Kharazim", "Raynor", "Brightwing", "The Butcher", "Anub'arak"], map: [], tags: [])
//var chromie = Hero(name: "Chromie", role: "Ranged Assassin", synergy: ["Xul", "ETC", "Malfurion", "Jaina", "Murky"], strong: ["Sgt. Hammer"], weak: ["Zeratul", "Greymane", "Tracer", "Nova", "Illidan", "Kerrigan", "The Butcher", "Thrall", "Anub'arak", "Lunara", "Falstad", "Stitches"], map: ["Towers of Doom"], tags: [])
//var dehaka = Hero(name: "Dehaka", role: "", synergy: ["Xul", "Brightwing"], strong: ["Abathur", "Lt. Morales"], weak: ["Tychus", "Lunara"], map: ["Dragon Shire", "Towers of Doom", "Cursed Hollow"], tags: [])
//var diablo = Hero(name: "Diablo", role: "Melee Warrior", synergy: ["Tyrande", "Rehgar", "Uther", "Zeratul", "Valla", "Greymane", "Li-Ming"], strong: ["Lt. Morales", "Nova", "Sgt. Hammer", "Nazeebo"], weak: ["Leoric"], map: ["Tomb of the Spider Queen", "Infernal Shrines"], tags: [])
//var etc = Hero(name: "ETC", role: "Melee Warrior", synergy: ["Kael'thas", "Valla", "Jaina", "Li-Ming", "Rehgar", "Nazebo", "Chromie", "Sgt. Hammer", "The Butcher", "Gazlowe", "Falstad", "Tychus", "Nova", "Zagara", "Illidan", "Greymane", "Kharazim"], strong: ["Chen", "Li Li", "Illidan", "Nova", "Zeratul"], weak: ["Brightwing", "Tyrande", "Falstad", "Raynor", "Johanna", "Anub'arak"], map: ["Cursed Hollow", "Blackheart's Bay", "Haunted Mines", "Towers of Doom"], tags: [])
//var falstad = Hero(name: "Falstad", role: "Ranged Assassin", synergy: ["ETC", "Tyreal", "Brightwing"], strong: ["ETC", "Sylvanas", "Chromie", "Leoric", "Jaina"], weak: ["Zeratul", "Nova"], map: ["Dragon Shire", "Cursed Hollow", "Sky Temple", "Blackheart's Bay", "Towers of Doom"], tags: [])
//var gall = Hero(name: "Gall", role: "Ranged Assassin", synergy: ["Lt. Morales", "Rehgar", "Uther"], strong: ["Zeratul", "Nova", "Lt. Morales"], weak: ["Leoric", "Kharazim", "Raynor", "Brightwing", "The Butcher", "Anub'arak"], map: [], tags: [])
//var gazlowe = Hero(name: "Gazlowe", role: "Melee Specialist", synergy: ["ETC"], strong: [], weak: ["Kael'thas", "Greymane"], map: ["Dragon Shire", "Sky Temple", "Infernal Shrines"], tags: [])
//var greymane = Hero(name: "Greymane", role: "Ranged Assassin", synergy: ["Abathur", "Tassadar", "Lt. Morales", "Rehgar", "Tyrande", "ETC", "Diablo"], strong: ["Chromie", "Jaina", "Li-Ming", "Valla", "Gul'dan", "Lt. Morales", "Gazlowe", "Lunara"], weak: ["The Butcher", "Xul", "Brightwing"], map: ["Battlefield of Eternity", "Garden of Terror"], tags: [])
//var gulDan = Hero(name: "Gul'dan", role: "Ranged Assassin", synergy: ["Malfurion", "Lt. Morales"], strong: [], weak: ["Greymane"], map: [], tags: [])
//var illidan = Hero(name: "Illidan", role: "Melee Assassin", synergy: ["Abathur", "Rehgar", "Tassadar", "Uther", "Lt. Morales", "Kharazim", "Medivh", "Li Li", "ETC", "Tyrande"], strong: ["Chromie", "Lt. Morales", "Nazeebo", "Tyrande", "Valla", "Li-Ming", "Jaina", "Nova", "Kael'thas", "Malfurion", "Rexxar", "Raynor", "Lunara"], weak: ["Brightwing", "Xul", "Uther", "Muradin", "Johanna", "Li Li", "Sonya", "ETC", "Tychus", "Artanis"], map: ["Blackheart's Bay"], tags: [])
//var jaina = Hero(name: "Jaina", role: "Ranged Assassin", synergy: ["Johanna", "ETC", "Xul", "Malfurion", "Nazeebo", "Arthas", "The Butcher", "Tyrande", "Anub'arak", "Kerrigan", "Kael'thas", "Zeratul", "Chromie", "Raynor"], strong: ["Malfurion", "Sgt. Hammer", "The Lost Vikings", "Xul", "Brightwing"], weak: ["Tracer", "Greymane", "Zeratul", "Nova", "Tyreal", "Kerrigan", "Lunara", "Illidan", "Muradin", "Falstad"], map: ["Infernal Shrines", "Tomb of the Spider Queen", "Haunted Mines", "Battlefield of Eternity"], tags: [])
//var johanna = Hero(name: "Johanna", role: "Melee Warrior", synergy: ["Jaina", "Kael'thas", "Li-Ming", "Nazeebo", "Azmodan", "Malfurion", "Kerrigan", "Abathur", "Rehgar", "The Butcher"], strong: ["Nova", "Zeratul", "Illidan", "Xul", "Thrall", "The Butcher", "Li Li", "ETC"], weak: ["Leoric"], map: ["Tomb of the Spider Queen", "Infernal Shrines", "Garden of Terror", "Battlefield of Eternity", "Towers of Doom", "Haunted Mines", "Blackheart's Bay", "Dragon Shire"], tags: [])
//var kaelThas = Hero(name: "Kael'thas", role: "Ranged Assassin", synergy: ["ETC", "Johanna", "Muradin", "Malfurion", "Jaina", "Uther", "Arthas", "Tyrande", "Zeratul", "The Butcher", "Anub'arak"], strong: ["The Lost Vikings", "Gazlowe", "Sgt. Hammer"], weak: ["Tyrael", "Nova", "Zeratul", "Kerrigan", "The Butcher", "Illidan", "Muradin"], map: ["Infernal Shrines", "Tomb of the Spider Queen", "Cursed Hollow", "Battlefield of Eternity", "Sky Temple", "Garden of Terror"], tags: [])
//var kerrigan = Hero(name: "Kerrigan", role: "Melee Assassin", synergy: ["Tyrande", "Abathur", "Uther", "Tassadar", "Xul", "Anub'arak", "Arthas", "Jaina", "Johanna", "Kharazim", "Muradin", "Rehgar"], strong: ["Chromie", "Kael'thas", "Lt. Morales", "Jaina", "Tyrande", "Sgt. Hammer", "Zagara"], weak: ["Uther", "Muradin", "Sonya"], map: ["Tomb of the Spider Queen", "Infernal Shrines", "Haunted Mines"], tags: [])
//var kharazim = Hero(name: "Kharazim", role: "Melee Support", synergy: ["Illidan", "Tyrael", "The Butcher", "Chen", "Kerrigan", "Thrall", "ETC"], strong: ["Cho'gall", "Zeratul", "Stitches"], weak: ["Li Li", "Xul"], map: [], tags: [])
//var leoric = Hero(name: "Leoric", role: "Melee Warrior", synergy: ["Abathur", "Nazeebo"], strong: ["Cho'gall", "Stitches", "Diablo", "Muradin", "Arthas", "Johanna", "Azmodan", "Tyrael"], weak: ["Raynor", "Tracer", "Valla", "Falstad"], map: ["Infernal Shrines", "Haunted Mines", "Dragon Shire"], tags: [])
//var lili = Hero(name: "Li Li", role: "Ranged Support", synergy: ["Valla", "Illidan", "Raynor", "Tyrael", "Chen", "Tychus"], strong: ["Illidan", "Thrall", "Tracer", "The Butcher", "Kharazim", "Raynor"], weak: ["Anub'arak", "Muradin", "ETC", "Johanna"], map: [], tags: [])
//var liMing = Hero(name: "Li-Ming", role: "Ranged Assassin", synergy: ["ETC", "Xul", "Johanna", "Malfurion", "Rehgar", "Diablo"], strong: ["Sgt. Hammer", "The Lost Vikings", "Murky", "Malfurion"], weak: ["Tracer", "Greymane", "Zeratul", "Illidan", "The Butcher", "Chen"], map: ["Battlefield of Eternity", "Cursed Hollow", "Sky Temple"], tags: [])
//var ltMorales = Hero(name: "Lt. Morales", role: "Ranged Support", synergy: ["Raynor", "The Butcher", "Sonya", "Sgt. Hammer", "Valla", "Cho'gall", "Illidan", "Greymane", "Thrall", "Lunara", "Tychus", "Artanis", "Kerrigan", "Gul'dan"], strong: [], weak: ["Tracer", "Illidan", "Zeratul", "The Butcher", "Diablo", "Stitches", "Dehaka", "Kerrigan", "Anub'arak", "Greymane", "Nova", "Tyrael", "Thrall", "Muradin", "Lunara", "Artanis", "Murky", "Cho'gall", "Chen"], map: [], tags: [])
//var lunara = Hero(name: "Lunara", role: "Ranged Assassin", synergy: ["Arthas", "Lt. Morales", "Tyrande"], strong: ["Uther", "Jaina", "Dehaka", "Chromie", "Lt. Morales"], weak: ["Chen", "The Butcher", "Greymane", "Illidan"], map: ["Battlefield of Eternity"], tags: [])
//var malfurion = Hero(name: "Malfurion", role: "Ranged Support", synergy: ["Jaina", "Nazebo", "Li-Ming", "Kael'thas", "Johanna", "Valla", "Chromie", "Stitches", "Gul'dan", "Artanis", "Xul", "Zagara"], strong: [], weak: ["Jaina", "Tracer", "The Butcher", "Anub'arak", "Illidan", "Tyrael", "Thrall", "Li-Ming"], map: [], tags: [])
//var medivh = Hero(name: "Medivh", role: "Ranged Specialist", synergy: ["Illidan", "Thrall", "Sonya", "The Butcher"], strong: ["Abathur"], weak: [], map: [], tags: [])
//var muradin = Hero(name: "Muradin", role: "Melee Warrior", synergy: ["Kael'thas", "Tyrande", "Kerrigan", "Abathur"], strong: ["Zeratul", "Illidan", "Nova", "Chen", "Kerrigan", "The Butcher", "Li Li", "Lt. Morales", "Jaina", "Kael'thas"], weak: ["Leoric"], map: ["Battlefield of Eternity", "Blackheart's Bay"], tags: [])
//var murky = Hero(name: "Murky", role: "Melee Specialist", synergy: ["Tassadar", "Abathur", "Chromie"], strong: ["Lt. Morales"], weak: ["Tracer", "Tychus", "Li-Ming", "Nova", "Zeratul", "Valla"], map: ["Garden of Terror", "Sky Temple"], tags: [])
//var nazeebo = Hero(name: "Nazeebo", role: "Ranged Specialist", synergy: ["Jaina", "Malfurion", "ETC", "Johanna", "Sylvanas", "Leoric"], strong: ["Sgt. Hammer"], weak: ["Illidan", "Sonya", "Zeratul", "Anub'arak", "Sylvanas", "Diablo"], map: ["Cursed Hollow", "Tomb of the Spider Queen", "Sky Temple", "Dragon Shire", "Infernal Shrines"], tags: [])
//var nova = Hero(name: "Nova", role: "Ranged Assassin", synergy: ["Tyrande", "ETC"], strong: ["Chromie", "Sylvanas", "Kael'thas", "Abathur", "Jaina", "Valla", "Lt. Morales", "Sgt. Hammer", "Murky", "Falstad", "Zagara", "The Lost Vikings"], weak: ["Tassadar", "Johanna", "Tyrael", "Muradin", "Arthas", "Chen", "Cho'gall", "The Butcher", "Diablo", "Illidan", "Artanis", "ETC", "Anub'arak", "Zeratul"], map: [], tags: [])
//var raynor = Hero(name: "Raynor", role: "Ranged Assassin", synergy: ["Lt. Morales", "Arthas", "Li Li", "Thrall", "Jaina"], strong: ["Cho'gall", "Leoric", "Tracer", "ETC", "Valla", "Sylvanas"], weak: ["Illidan", "Li Li"], map: ["Battlefield of Eternity", "Tomb of the Spider Queen"], tags: [])
//var rehgar = Hero(name: "Rehgar", role: "Melee Support", synergy: ["Illidan", "Thrall", "ETC", "Diablo", "Sonya", "Cho'gall", "Chen", "Anub'arak", "Greymane", "The Butcher", "Tyrael", "Li-Ming", "Johanna", "Kerrigan"], strong: [], weak: [], map: ["Dragon Shire", "Blackheart's Bay", "Garden of Terror", "Battlefield of Eternity", "Sky Temple", "Infernal Shrines"], tags: [])
//var rexxar = Hero(name: "Rexxar", role: "Ranged Warrior", synergy: [], strong: [], weak: [], map: [], tags: [])
//var sgtHammer = Hero(name: "Sgt. Hammer", role: "Ranged Specialist", synergy: ["Lt. Morales", "ETC", "Uther", "Li Li"], strong: [], weak: ["Chromie", "Stitches", "Artanis", "Li-Ming", "Nazeebo", "Jaina", "The Butcher", "Zagara", "Nova", "Kael'thas", "Tyrande", "Kerrigan", "Diablo", "Zeratul"], map: ["Battlefield of Eternity", "Infernal Shrines"], tags: [])
//var sonya = Hero(name: "Sonya", role: "Melee Assassin", synergy: ["Lt. Morales", "Abathur", "Tassadar", "Rehgar", "Uther", "Medivh"], strong: ["Nazeebo", "Illidan", "Zeratul", "Azmodan", "Kerrigan"], weak: ["Brightwing", "Uther", "Muradin"], map: ["Infernal Shrines", "Tomb of the Spider Queen", "Blackheart's Bay"], tags: [])
//var stitches = Hero(name: "Stitches", role: "Melee Warrior", synergy: ["Tyrande", "Malfurion", "Uther"], strong: ["Sgt. Hammer", "Lt. Morales", "Jaina", "Chromie"], weak: ["Leoric", "Kharazim"], map: [], tags: [])
//var sylvanas = Hero(name: "Sylvanas", role: "Ranged Specialist", synergy: ["Valla", "Tyrande", "Nazeebo"], strong: ["Nazeebo", "The Lost Vikings"], weak: ["Zeratul", "Nova", "Zagara", "Falstad", "The Butcher", "Raynor"], map: ["Haunted Mines", "Tomb of the Spider Queen", "Infernal Shrines", "Garden of Terror", "Towers of Doom"], tags: [])
//var tassadar = Hero(name: "Tassadar", role: "Ranged Support", synergy: ["Illidan", "Artanis", "Tracer", "Greymane", "Kerrigan", "Sonya", "Thrall", "Tyrael", "Murky", "Zeratul"], strong: ["Nova", "Zeratul"], weak: [], map: ["Haunted Mines", "Tomb of the Spider Queen"], tags: [])
//var theButcher = Hero(name: "The Butcher", role: "Melee Assassin", synergy: ["Abathur", "Lt. Morales", "Tyrande", "Uther", "Jaina", "ETC", "Tyrael", "Rehgar", "Anub'arak", "Kharazim", "Kael'thas", "Johanna"], strong: ["Lt. Morales", "Chromie", "Sgt. Hammer", "Greymane", "Nova", "Valla", "Kael'thas", "Malfurion", "Azmodan", "Li-Ming", "Sylvanas", "Lunara"], weak: ["Uther", "Xul", "Brightwing", "Li Li", "Johanna", "Muradin"], map: [], tags: [])
//var theLostVikings = Hero(name: "The Lost Vikings", role: "Melee Specialist", synergy: ["Brightwing"], strong: [], weak: ["Kael'thas", "Zeratul", "Li-Ming", "Jaina", "Tracer", "Valla", "Sylvanas"], map: ["Cursed Hollow", "Garden of Terror", "Sky Temple"], tags: [])
//var thrall = Hero(name: "Thrall", role: "Melee Assassin", synergy: ["Rehgar", "Abathur", "Lt. Morales", "Tassadar", "Medivh", "Tyrande", "Kharazim"], strong: ["Chromie", "Lt. Morales", "Malfurion", "Zeratul"], weak: ["Johanna", "Li Li", "Xul", "Brightwing"], map: ["Dragon Shire", "Towers of Doom", "Blackheart's Bay"], tags: [])
//var tracer = Hero(name: "Tracer", role: "Ranged Assassin", synergy: ["Tassadar"], strong: ["Chromie", "Li-Ming", "Jaina", "Lt. Morales", "Murky", "Malfurion", "Leoric", "Tyrande", "The Lost Vikings", "Arthas"], weak: ["Brightwing", "Li Li", "Raynor"], map: ["Blackheart's Bay"], tags: [])
//var tychus = Hero(name: "Tychus", role: "Ranged Assassin", synergy: ["ETC", "Lt. Morales", "Li Li"], strong: ["Murky", "Dehaka", "Illidan"], weak: [], map: [], tags: [])
//var tyrael = Hero(name: "Tyrael", role: "Melee Warrior", synergy: ["Anub'arak", "Abathur", "The Butcher", "Kharazim", "Tassadar", "Rehgar", "Falstad", "Li Li"], strong: ["Kael'thas", "Nova", "Jaina", "Zeratul", "Lt. Morales", "Valla", "Malfurion"], weak: ["Leoric"], map: [], tags: [])
//var tyrande = Hero(name: "Tyrande", role: "Ranged Support", synergy: ["Diablo", "Kerrigan", "The Butcher", "Xul", "Muradin", "Jaina", "Nova", "Arthas", "Stitches", "Sylvanas", "Greymane", "Valla", "Kael'thas", "Thrall", "Zeratul", "Lunara", "Illidan"], strong: ["Abathur", "ETC", "Sgt. Hammer", "Chen"], weak: ["Illidan", "Zeratul", "Kerrigan", "Tracer"], map: ["Cursed Hollow", "Blackheart's Bay", "Battlefield of Eternity"], tags: [])
//var uther = Hero(name: "Uther", role: "Melee Support", synergy: ["Illidan", "Kerrigan", "The Butcher", "Zeratul", "Sonya", "Kael'thas", "Diablo", "Sgt. Hammer", "Stitches", "Valla", "Cho'gall"], strong: ["Illidan", "The Butcher", "Chen", "Zeratul", "Kerrigan", "Sonya", "Artanis"], weak: ["Lunara"], map: [], tags: [])
//var valla = Hero(name: "Valla", role: "Ranged Assassin", synergy: ["ETC", "Lt. Morales", "Sylvanas", "Li Li", "Tyrande", "Malfurion", "Zagara", "Brightwing", "Diablo", "Arthas", "Uther"], strong: ["Leoric", "The Lost Vikings", "Murky"], weak: ["Zeratul", "Greymane", "Nova", "Illidan", "The Butcher", "Raynor", "Tyrael"], map: ["Battlefield of Eternity", "Garden of Terror", "Infernal Shrines", "Cursed Hollow", "Tomb of the Spider Queen", "Blackheart's Bay"], tags: [])
//var xul = Hero(name: "Xul", role: "Melee Specialist", synergy: ["Chromie", "Dehaka", "Jaina", "Li-Ming", "Tyrande", "Kerrigan", "Malfurion"], strong: ["Illidan", "The Butcher", "Thrall", "Greymane", "Kharazim"], weak: ["Johanna", "Jaina", "Tracer"], map: ["Tomb of the Spider Queen", "Infernal Shrines", "Dragon Shire", "Towers of Doom", "Blackheart's Bay"], tags: [])
//var zagara = Hero(name: "Zagara", role: "Ranged Specialist", synergy: ["ETC", "Valla", "Zeratul"], strong: ["Sgt. Hammer", "Sylvanas"], weak: ["Zeratul", "Kerrigan", "Nova"], map: ["Tomb of the Spider Queen", "Blackheart's Bay", "Towers of Doom", "Sky Temple", "Dragon Shire"], tags: [])
//var zeratul = Hero(name: "Zeratul", role: "Melee Assassin", synergy: ["Abathur", "Uther", "Jaina", "Tassadar", "Diablo", "Tyrande", "Zagara", "Kael'thas"], strong: ["Chromie", "Abathur", "Sylvanas", "Valla", "Kael'thas", "Jaina", "Li-Ming", "The Lost Vikings", "Tyrande", "Nazebo", "Zagara", "Falstad", "Murky", "Sgt. Hammer", "Nova"], weak: ["Johanna", "Tassadar", "Muradin", "Arthas", "Tyrael", "Uther", "Cho'gall", "Chen", "Sonya", "Artanis", "Kharazim", "ETC", "Rehgar", "Thrall", "Brightwing"], map: ["Blackheart's Bay", "Dragon Shire", "Tomb of the Spider Queen", "Cursed Hollow", "Garden of Terror"], tags: [])
//var battlefieldOfEternity = Hero(name: "Battlefield of Eternity", role: "", synergy: ["Greymane", "Jaina", "Johanna", "Kael'thas", "Li-Ming", "Lunara", "Muradin", "Raynor", "Rehgar", "Sgt. Hammer", "Tyrande", "Valla"], strong: [], weak: [], map: [], tags: [])
//var blackheartsBay = Hero(name: "Blackheart's Bay", role: "", synergy: ["ETC", "Falstad", "Illidan", "Johanna", "Muradin", "Rehgar", "Sonya", "Thrall", "Tracer", "Tyrande", "Valla", "Xul", "Zagara", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var cursedHollow = Hero(name: "Cursed Hollow", role: "", synergy: ["Abathur", "Brightwing", "Dehaka", "ETC", "Falstad", "Kael'thas", "Li-Ming", "Nazeebo", "The Lost Vikings", "Tyrande", "Valla", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var dragonShire = Hero(name: "Dragon Shire", role: "", synergy: ["Anub'arak", "Brightwing", "Dehaka", "Falstad", "Gazlowe", "Johanna", "Leoric", "Nazeebo", "Rehgar", "Thrall", "Xul", "Zagara", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var gardenOfTerror = Hero(name: "Garden of Terror", role: "", synergy: ["Abathur", "Anub'arak", "Greymane", "Johanna", "Kael'thas", "Murky", "Rehgar", "Sylvanas", "The Lost Vikings", "Valla", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var hauntedMines = Hero(name: "Haunted Mines", role: "", synergy: ["Arthas", "ETC", "Jaina", "Johanna", "Kerrigan", "Leoric", "Sylvanas", "Tassadar"], strong: [], weak: [], map: [], tags: [])
//var infernalShrines = Hero(name: "Infernal Shrines", role: "", synergy: ["Arthas", "Diablo", "Gazlowe", "Jaina", "Johanna", "Kael'thas", "Kerrigan", "Leoric", "Nazeebo", "Rehgar", "Sgt. Hammer", "Sonya", "Sylvanas", "Valla", "Xul"], strong: [], weak: [], map: [], tags: [])
//var skyTemple = Hero(name: "Sky Temple", role: "", synergy: ["Abathur", "Anub'arak", "Brightwing", "Falstad", "Gazlowe", "Kael'thas", "Li-Ming", "Murky", "Nazeebo", "Rehgar", "The Lost Vikings", "Zagara"], strong: [], weak: [], map: [], tags: [])
//var tombOfTheSpiderQueen = Hero(name: "Tomb of the Spider Queen", role: "", synergy: ["Azmodan", "Diablo", "Jaina", "Johanna", "Kael'thas", "Kerrigan", "Nazeebo", "Raynor", "Sonya", "Sylvanas", "Tassadar", "Valla", "Xul", "Zagara", "Zeratul"], strong: [], weak: [], map: [], tags: [])
//var towersOfDoom = Hero(name: "Towers of Doom", role: "", synergy: ["Chromie", "Dehaka", "ETC", "Falstad", "Johanna", "Sylvanas", "Thrall", "Xul", "Zagara"], strong: [], weak: [], map: [], tags: [])
//
//
//
//
//
//func findSynergy(heroArray: [Hero], heroToFilter: String, increment: Int){
//    let heroesWithSynergy = heroArray.filter( { $0.synergy.contains("\(heroToFilter)") } )
//    for hero in heroesWithSynergy{
//        hero.pickValue = hero.pickValue + increment
//        
//    }
//}
//
//func findStrong(heroArray: [Hero], heroToFilter: String, increment: Int){
//    let heroesWithStrong = heroArray.filter( { $0.strong.contains("\(heroToFilter)") } )
//    for hero in heroesWithStrong{
//        hero.pickValue = hero.pickValue + increment
//        
//    }
//}
//
//func findWeak(heroArray: [Hero], heroToFilter: String, increment: Int){
//    let heroesWithWeak = heroArray.filter( { $0.weak.contains("\(heroToFilter)") } )
//    for hero in heroesWithWeak{
//        hero.pickValue = hero.pickValue + increment
//        
//    }
//}
//
//func findHeroToRemove(inout heroArray: [Hero], heroToFilter: String){
//    
//    //var heroToRemove = heroArray
//    let indexOfHeroToRemove = heroArray.indexOf({$0.name.containsString("\(heroToFilter)") } )
//    print(indexOfHeroToRemove)
//    for hero in heroArray{
//        print(hero.name)
//    }
//    heroArray.removeAtIndex(indexOfHeroToRemove!)
//    
//    
//}
//
//
//func findMapSynergy(heroArray: [Hero], mapToFilter: String, increment: Int){
//    let heroesWithSynergy = heroArray.filter( { $0.map.contains("\(mapToFilter)") } )
//    for hero in heroesWithSynergy{
//        hero.pickValue = hero.pickValue + increment
//        
//    }
//}
//
//
