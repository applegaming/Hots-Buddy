//
//  HotsLogsData.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/22/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation


class HotsHero: NSObject, NSCoding  {
    let name: String
    let gamesPlayed: Int
    let gamesBanned: Int
    let popularity: Double
    let winPercent: Double
    let percentChange: Double
    var talents = [HotsTalent]()
    
    init(name: String, gamesPlayed: Int, gamesBanned: Int, popularity: Double, winPercent: Double, percentChange: Double, talents: [HotsTalent]) {
        
        self.name = name
        self.gamesPlayed = gamesPlayed
        self.gamesBanned = gamesBanned
        self.popularity = popularity
        self.winPercent = winPercent
        self.percentChange = percentChange
        self.talents = talents
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
       
       
        
        //let tempArray = dict["talents"] as! [[String: AnyObject]]
        //let talentsArray = tempArray.map{ HotsTalent(fromDictionary: $0) }
        
        self.init(
            name: handleJsonErrors(dict["heroName"], type: "string") as! String,
            gamesPlayed: handleJsonErrors(dict["gamesPlayed"], type: "int") as! Int,
            gamesBanned: handleJsonErrors(dict["gamesBanned"], type: "int") as! Int,
            popularity: handleJsonErrors(dict["popularity"], type: "double") as! Double,
            winPercent: handleJsonErrors(dict["winPercent"], type: "double") as! Double,
            percentChange: handleJsonErrors(dict["percentChange"], type: "double") as! Double,
            talents: [HotsTalent]()
        )
    }
    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let gamesPlayed = aDecoder.decodeInteger(forKey: "gamesPlayed")
        let gamesBanned = aDecoder.decodeInteger(forKey: "gamesBanned")
        let popularity = aDecoder.decodeDouble(forKey: "popularity")
        let winPercent = aDecoder.decodeDouble(forKey: "winPercent")
        let percentChange = aDecoder.decodeDouble(forKey: "percentChange")
        let talents = aDecoder.decodeObject(forKey: "talents") as! [HotsTalent]
        self.init(name: name, gamesPlayed: gamesPlayed, gamesBanned: gamesBanned, popularity: popularity, winPercent: winPercent, percentChange: percentChange, talents: talents)
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {

        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.gamesPlayed, forKey: "gamesPlayed")
        aCoder.encode(self.gamesBanned, forKey: "gamesBanned")
        aCoder.encode(self.popularity, forKey: "popularity")
        aCoder.encode(self.winPercent, forKey: "winPercent")
        aCoder.encode(self.percentChange, forKey: "percentChange")
        aCoder.encode(self.talents, forKey: "talents")
    }
}

class HotsBuild {
    let name: String
    let diamondTalents: [HotsTalent]
    let bronzeTalents: [HotsTalent]
    
    init(name: String, diamondTalents: [HotsTalent], bronzeTalents: [HotsTalent]) {
        
        self.name = name
        self.diamondTalents = diamondTalents
        self.bronzeTalents = bronzeTalents
        
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
        
        let diamondArray = dict["diamondTalents"] as! [[String: AnyObject]]
        let diamondTalentsArray = diamondArray.map{ HotsTalent(fromDictionary: $0) }
        
        let bronzeArray = dict["bronzeTalents"] as! [[String: AnyObject]]
        let bronzeTalentsArray = bronzeArray.map{ HotsTalent(fromDictionary: $0) }

        
        self.init(
            name: handleJsonErrors(dict["heroName"], type: "string") as! String,
            diamondTalents: diamondTalentsArray,
            bronzeTalents: bronzeTalentsArray
        )
    }
}

class HotsTalent: NSObject, NSCoding {
    let name: String
    let gamesPlayed: Int
    let popularity: Double
    let winPercent: Double


    
    init(name: String, gamesPlayed: Int, popularity: Double, winPercent: Double) {
        
        self.name = name
        self.gamesPlayed = gamesPlayed
        self.popularity = popularity
        self.winPercent = winPercent
        
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
        
        
        self.init(
            name: handleJsonErrors(dict["name"], type: "string") as! String,
            gamesPlayed: handleJsonErrors(dict["gamesPlayed"], type: "int") as! Int,
            popularity: handleJsonErrors(dict["popularity"], type: "double") as! Double,
            winPercent: handleJsonErrors(dict["winPercent"], type: "double") as! Double
            
        )
    }
    
    //include all properties you want to store
    required convenience init?(coder aDecoder: NSCoder) {
        
        let name = aDecoder.decodeObject(forKey: "name") as! String
        let gamesPlayed = aDecoder.decodeInteger(forKey: "gamesPlayed")
        let popularity = aDecoder.decodeDouble(forKey: "popularity")
        let winPercent = aDecoder.decodeDouble(forKey: "winPercent")
        self.init(name: name, gamesPlayed: gamesPlayed, popularity: popularity, winPercent: winPercent)
        
    }
    
    //include all properties you want to load
    func encode(with aCoder: NSCoder) {
        
        aCoder.encode(self.name, forKey: "name")
        aCoder.encode(self.gamesPlayed, forKey: "gamesPlayed")
        aCoder.encode(self.popularity, forKey: "popularity")
        aCoder.encode(self.winPercent, forKey: "winPercent")
        
    }
    
}

func parseHotsLogsData(_ callback: @escaping (_ heroesArrayFromParse: [HotsHero]) -> Void) {
    
    
    let urlString = "https://www.parsehub.com/api/v2/projects/\(hotsLogsProject)/last_ready_run/data?api_key=t4bm23r0ByoX"
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
        
        print("continute after error")
        //...
        
        //heroSummary
        //heroBuild
        
        var arrayToReturn = [HotsHero]()
        
        var buildsArray = [HotsBuild]()
        
        for element in json["heroBuild"]! {
           
            print(element)
            let heroBuild = HotsBuild(fromDictionary: element)
            buildsArray.append(heroBuild)
            
        }
        
        
        for item in json["heroesSummary"]! {
            
            print(item)
            print("try to create hero")
            let hotsHeroesData = HotsHero(fromDictionary: item)
            //let hero = Hero(hero: heroData, synergy: [Hero](), strong: [Hero](), weak: [Hero](), map: [Battleground](), tags: [""], pickValue: 0, pickValueHistory: [Double](), builds: [[String: AnyObject]](), owned: false, favorite: false, inFreeHeroRotation: false)
            arrayToReturn.append(hotsHeroesData)
            
        }
        
        for hero in arrayToReturn {
            for build in buildsArray{
                if hero.name == build.name {
                    hero.talents = build.diamondTalents
                }
            }
        }
        
        callback(arrayToReturn)
        }).resume()//Closes Session.dataTaskWithURL
    //print("outside of resume \(heroes)")
} //Closes parseHeroesData()


