//
//  CountersHero.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/22/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation

class CountersHero {
    
    
    let name: String
    let tier: Int
    let strong: [CountersDetails]
    let weak: [CountersDetails]
    let synergy: [CountersDetails]
    let battleground: [CountersDetails]
    
    
    init(name: String, tier: Int, strong: [CountersDetails], weak: [CountersDetails], synergy: [CountersDetails], battlegrounds: [CountersDetails]){
        
        self.name = name
        self.tier = tier
        self.strong = strong
        self.weak = weak
        self.synergy = synergy
        self.battleground = battlegrounds
        
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
        
        
        
        let tempStrongArray = dict["strong"] as! [[String: AnyObject]]
        let strongArray = tempStrongArray.map{ CountersDetails(fromDictionary: $0) }
        
        let tempWeakArray = dict["weak"] as! [[String: AnyObject]]
        let weakArray = tempWeakArray.map{ CountersDetails(fromDictionary: $0) }
        
        let tempSynergyArray = dict["synergy"] as! [[String: AnyObject]]
        let synergyArray = tempSynergyArray.map{ CountersDetails(fromDictionary: $0) }
        
        let tempBattlegroundsArray = dict["battlegrounds"] as! [[String: AnyObject]]
        let battlegroundsArray = tempBattlegroundsArray.map{ CountersDetails(fromDictionary: $0) }
        
        
        self.init(
            name: handleJsonErrors(dict["name"], type: "string") as! String,
            tier: handleJsonErrors(dict["tier"], type: "int") as! Int,
            strong: strongArray,
            weak: weakArray,
            synergy: synergyArray,
            battlegrounds: battlegroundsArray
        )
    }
}

class CountersDetails {
    
    
    let name: String
    let points: Int
    let agree: Int
    let disagree: Int
    
    init(name: String, points: Int, agree: Int, disagree: Int){
        self.name = name
        self.points = points
        self.agree = agree
        self.disagree = disagree
    }
    
    convenience init(fromDictionary dict: [String: AnyObject]) {
        
        
        self.init(
            name: handleJsonErrors(dict["name"], type: "string") as! String,
            points: handleJsonErrors(dict["points"], type: "int") as! Int,
            agree: handleJsonErrors(dict["agree"], type: "int") as! Int,
            disagree: handleJsonErrors(dict["disagree"], type: "int") as! Int

        )
    }
}


func parseHeroesCountersData(_ callback: @escaping (_ heroesArrayFromParse: [CountersHero]) -> Void) {
    
    
    let urlString = "https://www.parsehub.com/api/v2/projects/\(heroesCountersProject)/last_ready_run/data?api_key=t4bm23r0ByoX"
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
          var arrayToReturn = [CountersHero]()

        for element in json["heroRankings"]! {
            let countersHero = CountersHero(fromDictionary: element)
            arrayToReturn.append(countersHero)
        }
        
        
        callback(arrayToReturn)
        
    }).resume()//Closes Session.dataTaskWithURL
} //Closes parseHeroesData()
