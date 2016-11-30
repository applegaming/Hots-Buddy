//
//  FirstLoad.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 9/2/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation
import UIKit

class FirstLoad: UIViewController {

    @IBOutlet weak var statusText: UILabel!
    var installedDate: Date? {
        get {
            return UserDefaults().object(forKey: "installedDateKey") as? Date
        }
        set {
            UserDefaults().set(newValue, forKey: "installedDateKey")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        firstLoad()
        //testLoad()
    }
    
    func firstLoad() {
        if installedDate == nil {
            installedDate = Date()
            
            
            parseHeroesData() { heroesArrayFromParse in
                
                print("finished Heroes Data")
                heroes = heroesArrayFromParse
                appendHeroes() // for premade heroes
                appendBattlegrounds()
                addPremadeHeroToHero() // for relationships
                removeNoKeyExists()
                saveToDefaults("heroesOriginal")
                saveToDefaults("battlegrounds")
                print("First Run")
                
                //createTags()
                
               
                parseHotsLogsData() { heroesArrayFromParse in
                    print("finished HotsLogsData")
                    hotsLogsData = heroesArrayFromParse
                    saveToDefaults("hotsLogsData")
                    createPopularBuilds()
                    
                    
                    parseHeroesCountersData() { heroesArrayFromParse in
                        print("finished heroes Counters")
                        heroesCountersData = heroesArrayFromParse
                        createRelationships()
                        
                        
                        checkHeroRotation() { heroesArrayFromParse in
                            print("finished hero Rotation")
                            let stringOfFreeHeroes = heroesArrayFromParse
                            updateHeroRotation(stringOfFreeHeroes: stringOfFreeHeroes)
                            saveToDefaults("heroesOriginal")
                            
                            createImageDirectories()
                            getAllImages() { dummy in
                                
                                self.performSegue(withIdentifier: "firstLoadToHomeMenu", sender: nil)
                            }
                        }
                    }
                }
            }
            
//            
//            let serialQueue = DispatchQueue(label: "firstLoad")
//            serialQueue.sync {
//                parseHeroesData() { heroesArrayFromParse in
//                    
//                    print("finished Heroes Data")
//                    heroes = heroesArrayFromParse
//                    appendHeroes() // for premade heroes
//                    appendBattlegrounds()
//                    addPremadeHeroToHero() // for relationships
//                    removeNoKeyExists()
//                    saveToDefaults("heroesOriginal")
//                    saveToDefaults("battlegrounds")
//                    print("First Run")
//                    //createTags()
//                }
//            }
//            serialQueue.sync {
//                parseHotsLogsData() { heroesArrayFromParse in
//                    print("finished HotsLogsData")
//                    hotsLogsData = heroesArrayFromParse
//                    saveToDefaults("hotsLogsData")
//                    createPopularBuilds()
//                }
//                
//            }
//            serialQueue.sync {
//                parseHeroesCountersData() { heroesArrayFromParse in
//                    print("finished heroes Counters")
//                    heroesCountersData = heroesArrayFromParse
//                    createRelationships()
//                }
//            }
//            serialQueue.sync {
//                checkHeroRotation() { heroesArrayFromParse in
//                    print("finished hero Rotation")
//                    let stringOfFreeHeroes = heroesArrayFromParse
//                    updateHeroRotation(stringOfFreeHeroes: stringOfFreeHeroes)
//                    saveToDefaults("heroesOriginal")
//                }
//            }
//            serialQueue.sync {
//                createImageDirectories()
//                getAllImages() { dummy in
//                    //self.performSegue(withIdentifier: "firstLoadToHomeMenu", sender: nil)
//                }
//                
//            }
//            serialQueue.sync {
//                
//                self.performSegue(withIdentifier: "firstLoadToHomeMenu", sender: nil)
//
//            }

            

            
        } else {
            print("Not first run, installd on \(installedDate!)")
            
            
            
            loadFromDefaults("userProfile")
            print("User Profile is \(userProfile)")
            loadFromDefaults(userProfile)
            loadFromDefaults("battlegrounds")
            loadFromDefaults("hotsLogsData")
            createTags()
            
            testThisCode()
            
            performSegue(withIdentifier: "firstLoadToHomeMenu", sender: nil)

        }

    }
    
    func testLoad() {
        createHeroes()
        self.performSegue(withIdentifier: "firstLoadToHomeMenu", sender: nil)
    }

    
    
    
    func segue(){
        performSegue(withIdentifier: "firstLoadToHomeMenu", sender: nil)
    }
    
}

func testThisCode(){
    
    print("running test code")
    
    
    
    
    

    
//    for hero in topHeroes {
//
//        print("\(hero.hero.name) hero is in the topHeroes")
//    }
//
//    checkHeroRotation() { heroesArrayFromParse in             //Do stuff after parse
//        print("finished hero Rotation")
//        let stringOfFreeHeroes = heroesArrayFromParse
//        updateHeroRotation(stringOfFreeHeroes: stringOfFreeHeroes)
//        saveToDefaults("heroesOriginal")
//    }
//    
//    for hero in heroes{
//        print("\(hero.hero.name) and \(hero.inFreeHeroRotation)")
//    }



    
    
//    parseHeroesCountersData() { heroesArrayFromParse in             //Do stuff after parse
//        print("finished heroes Counters")
//        heroesCountersData = heroesArrayFromParse
//        createRelationships()
//        
//        var average = 0.0
//        for item in hotsLogsData {
//            average = average + item.popularity
//            
//        }
//        print(hotsLogsData.count)
//        average = (average / Double(hotsLogsData.count))
//        print("The Average is \(average)")
//    }
    
//    parseHotsLogsData() { heroesArrayFromParse in             //Do stuff after parse
//        print("finished HotsLogsData")
//        hotsLogsData = heroesArrayFromParse
//
//        
//        var average = 0.0
//        for item in hotsLogsData {
//            average = average + item.popularity
//            
//        }
//        print(hotsLogsData.count)
//        average = (average / Double(hotsLogsData.count))
//        print("The Average is \(average)")
//
//    }


    
    
}


func testFunc(_ callback: @escaping (_ heroesArrayFromParse: [HotsHero]) -> Void) {
    
    
    let bundle = Bundle.main
    let path = bundle.path(forResource: "hotslogs", ofType: "json")
    //var error:NSError?
    guard let responseData:NSData = try NSData(contentsOfFile: path!) else { return }
    
    var json: [String: [[String: AnyObject]]]!
    
    do {
        json = try JSONSerialization.jsonObject(with: responseData as Data, options: JSONSerialization.ReadingOptions.allowFragments) as! [String: [[String: AnyObject]]]
        print("sucessfully got JSON")
        
    }
    catch {
        print("error reading JSON")
    }
    
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
    
    //print("outside of resume \(heroes)")
} //Closes parseHeroesData()
