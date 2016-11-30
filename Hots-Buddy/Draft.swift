//
//  Draft.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 10/4/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import UIKit
import Foundation

class Draft: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UISearchBarDelegate {

    
    @IBOutlet weak var battlegroundName: UILabel!
    @IBOutlet weak var draftStatus: UILabel!
    @IBOutlet weak var draftNotes: UILabel!
    
    @IBOutlet weak var collectionHeroPool: UICollectionView!
    @IBOutlet weak var collectionTeam1Bans: UICollectionView!
    @IBOutlet weak var collectionTeam2Bans: UICollectionView!
    @IBOutlet weak var collectionTeam1Picks: UICollectionView!
    @IBOutlet weak var collectionTeam2Picks: UICollectionView!
    
    @IBAction func undoButton(_ sender: AnyObject) {
        print(turn)
        undoTurnController(dummyHero)
    }
    @IBOutlet weak var undoButtonOutlet: UIButton!
    
    var team1First = true
    var battleground: Battleground!
    var team1 = [Hero]()
    var team2 = [Hero]()
    var turn = 1
    
//    var team1Bans = [Hero]()
//    var team2Bans = [Hero]()
//    var team1Picks = [Hero]()
//    var team2Picks = [Hero]()
    
    var team1Active = true
    var activeTeam = [Hero]()
    
    var team1Bans = [Int: Hero]()
    var team2Bans = [Int: Hero]()
    var team1Picks = [Int: Hero]()
    var team2Picks = [Int: Hero]()
    var bans1 = [1,9]
    var bans2 = [2,8]
    var picks1 = [3, 6, 7, 12, 13]
    var picks2 = [4, 5, 10, 11, 14]
    var pickedHeroes = [Hero]()
    

    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        let value = UIInterfaceOrientation.landscapeLeft.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        self.navigationController?.isNavigationBarHidden = true
        
        battlegroundName.text = battleground.name
        
        
        collectionHeroPool.delegate = self
        collectionHeroPool.dataSource = self
        collectionTeam1Bans.delegate = self
        collectionTeam1Bans.dataSource = self
        collectionTeam2Bans.delegate = self
        collectionTeam2Bans.dataSource = self
        collectionTeam1Picks.delegate = self
        collectionTeam1Picks.dataSource = self
        collectionTeam2Picks.delegate = self
        collectionTeam2Picks.dataSource = self
        
        
        self.view.addSubview(collectionHeroPool)
        self.view.addSubview(collectionTeam1Bans)
        self.view.addSubview(collectionTeam2Bans)
        self.view.addSubview(collectionTeam1Picks)
        self.view.addSubview(collectionTeam1Picks)
        
        print(userProfile)
        loadFromDefaults(userProfile) //drives what factors are accounted for when picking heroes
        
        fillDictionaries()
        
        findSynergy(heroes, heroToFilter: battleground.synergy, increment: 1)//consider wrapping this into turn 0
        team1 = heroes.clone()
        team2 = heroes.clone()
        collectionHeroPool.reloadData()
        
        
        
        
        if team1First == true {
            draftStatus.text = "Team 1 Ban"
            activeTeam = team1
            team1Active = true
        } else {
            activeTeam = team2
            draftStatus.text = "Team 2 Ban"
            team1Active = false
        }
        
        
        
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        let value = UIInterfaceOrientation.portrait.rawValue
        UIDevice.current.setValue(value, forKey: "orientation")
        loadFromDefaults(userProfile)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override var shouldAutorotate : Bool {
        return true
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HeroCell", for: indexPath) as? HeroCell {
            
            var hero: Hero!
            
            switch collectionView {
            case collectionHeroPool:
                hero = activeTeam[(indexPath as NSIndexPath).row]
                cell.configureDraftCell(hero, pickedHeroes: pickedHeroes, team1Active: team1Active)
                return cell
            case collectionTeam1Bans:
                let key = bans1[(indexPath as NSIndexPath).row]
                hero = team1Bans[key]
                cell.configureDraftCell(hero)
                return cell
            case collectionTeam2Bans:
                let key = bans2[(indexPath as NSIndexPath).row]
                hero = team2Bans[key]
                cell.configureDraftCell(hero)
                return cell
            case collectionTeam1Picks:
                let key = picks1[(indexPath as NSIndexPath).row]
                hero = team1Picks[key]
                cell.configureDraftCell(hero)
                return cell
            case collectionTeam2Picks:
                let key = picks2[(indexPath as NSIndexPath).row]
                hero = team2Picks[key]
                cell.configureDraftCell(hero)
                return cell
            default:
                return cell
            }
        }
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        
        var hero: Hero!

        
        hero = activeTeam[(indexPath as NSIndexPath).row]
        
        if (hero.hero.name == "Cho" || hero.hero.name == "Gall") && (turn != 1 && turn != 2 && turn != 4 && turn != 6 && turn != 8 && turn != 9 && turn != 10 && turn != 12)  {
            return false
        }
        
        
        for item in pickedHeroes{ if hero.hero.name == item.hero.name { return false }}
        if turn>14{ return false}
        
        return true

    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //need to figure out what turn and who went first
        
        var hero: Hero!
        
        if collectionView == collectionHeroPool {
            hero = activeTeam[(indexPath as NSIndexPath).row]
            print(hero.hero.name)
            turnController2(hero)
        }
        

    
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        
        switch collectionView {
        case collectionHeroPool:
            if team1First {
                return team1.count
            }else {
                return team2.count
            }
        case collectionTeam1Bans:
            return team1Bans.count
        case collectionTeam2Bans:
            return team2Bans.count
        case collectionTeam1Picks:
            return team1Picks.count
        case collectionTeam2Picks:
            return team2Picks.count
        default:
            print("number of items in section fail")
            return 0
            
        }
    
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func fillDictionaries(){
        
        if team1First == true {
            team1Bans = [1: dummyHero, 9: dummyHero]
            team2Bans = [2: dummyHero, 8: dummyHero]
            team1Picks = [3: dummyHero, 6: dummyHero, 7: dummyHero, 12: dummyHero, 13: dummyHero]
            team2Picks = [4: dummyHero, 5: dummyHero, 10: dummyHero, 11: dummyHero, 14: dummyHero]
            
            bans1 = [1,9]
            bans2 = [2,8]
            picks1 = [3, 6, 7, 12, 13]
            picks2 = [4, 5, 10, 11, 14]
            
        } else {
            team1Bans = [2: dummyHero, 8: dummyHero]
            team2Bans = [1: dummyHero, 9: dummyHero]
            team1Picks = [4: dummyHero, 5: dummyHero, 10: dummyHero, 11: dummyHero, 14: dummyHero]
            team2Picks = [3: dummyHero, 6: dummyHero, 7: dummyHero, 12: dummyHero, 13: dummyHero]
            
            bans2 = [1,9]
            bans1 = [2,8]
            picks2 = [3, 6, 7, 12, 13]
            picks1 = [4, 5, 10, 11, 14]
        }
        
        
    }

    func relationshipsFunc(_ hero: Hero){
        
        findSynergy(activeTeam, heroToFilter: hero.synergy, increment: 1)
        switchTeam()
        findSynergy(activeTeam, heroToFilter: hero.strong, increment: -1)
        findSynergy(activeTeam, heroToFilter: hero.weak, increment: 1)
        switchTeam()
        
    }
    func switchTeam(){
        
        if team1Active == true {
            activeTeam = team2
            team1Active = false
        } else if team1Active == false {
            activeTeam = team1
            team1Active = true
        }
        
    }
    
    
    
    func modifyPV(_ hero: Hero){
        
        for option in userOptions {
            if option[0] == "Relationships" && option[1] == "true" { relationshipsFunc(hero); print("called Relationships")}

        }
    }
    
    func recordPV(){
        for hero in team1{
            hero.pickValueHistory.append(hero.pickValue)
        }
        for hero in team2{
            hero.pickValueHistory.append(hero.pickValue)
        }
        
    }

    func banHero(_ hero: Hero){
        
        recordPV()
        pickedHeroes.append(hero)
        
        checkLoop: for heroObject in activeTeam {
            for item in team1 {
                if item === heroObject {
                    team1Bans[turn] = hero
                    if hero.hero.name == "Cho" {
                        choLoop: for apple in team1 {
                            if apple.hero.name == "Gall"{
                                pickedHeroes.append(apple)
                                break choLoop
                            }
                        }
                    } else if hero.hero.name == "Gall" {
                        gallLoop: for apple in team1 {
                            if apple.hero.name == "Cho"{
                                pickedHeroes.append(apple)
                                break gallLoop
                            }
                        }
                    }

                    break checkLoop
                }
            }
            for item in team2 {
                if item === heroObject {
                    team2Bans[turn] = hero
                    if hero.hero.name == "Cho" {
                        choLoop: for apple in team1 {
                            if apple.hero.name == "Gall"{
                                pickedHeroes.append(apple)
                                break choLoop
                            }
                        }
                    } else if hero.hero.name == "Gall" {
                        gallLoop: for apple in team1 {
                            if apple.hero.name == "Cho"{
                                pickedHeroes.append(apple)
                                break gallLoop
                            }
                        }
                    }

                    break checkLoop
                }
            }
        }

        
        turn = turn + 1
        reloadData()
        
    }
    func pickHero(_ hero: Hero){
        recordPV()
        modifyPV(hero)
        pickedHeroes.append(hero)
        
        checkLoop: for heroObject in activeTeam {
            for item in team1 {
                if item === heroObject {
                    team1Picks[turn] = hero
                    break checkLoop
                }
            }
            for item in team2 {
                if item === heroObject {
                    team2Picks[turn] = hero
                    break checkLoop
                }
            }
        }

        
        
        
        if (hero.hero.name == "Cho" || hero.hero.name == "Gall") && (turn == 4 || turn == 6 || turn == 10 || turn == 12) {
            checkForChoGall(hero)
        } else {
            turn = turn + 1
        }
        reloadData()
        
        

    }
    
    func checkForChoGall(_ hero: Hero){
        print("checking for cho'gall")
        print(hero.hero.name)
        if hero.hero.name == "Cho" {
            
            print("found cho")
            var gallHero: Hero!
            checkLoop: for heroObject in activeTeam {
                print("CHO CHECKLOOP")
                for item in team1 {
                    if item === heroObject {
                        print("TEAM1")
                        for temp in team1{
                            if temp.hero.name == "Gall" {
                                turn = turn + 1
                                gallHero = temp
                                turnController2(gallHero)
                                break checkLoop
                            }
                        }
                    }
                }
                for item in team2 {
                    if item === heroObject {
                        print("TEAM2")
                        for temp in team2{
                            if temp.hero.name == "Gall" {
                                turn = turn + 1
                                gallHero = temp
                                turnController2(gallHero)
                                break checkLoop
                            }
                        }
                    }
                }
            }
        } else if hero.hero.name == "Gall" {
            print("found Gall")
            var choHero: Hero!
            checkLoop: for heroObject in activeTeam {
                print("GALL CHECKLOOP")
                for item in team1 {
                    if item === heroObject {
                        print("TEAM 1")
                        for temp in team1{
                            if temp.hero.name == "Cho" {
                                turn = turn + 1
                                choHero = temp
                                turnController2(choHero)
                                break checkLoop
                            }
                        }
                    }
                }
                for item in team2 {
                    if item === heroObject {
                        for temp in team2{
                            print("TEAM 2")
                            if temp.hero.name == "Cho" {
                                turn = turn + 1
                                choHero = temp
                                turnController2(choHero)
                                break checkLoop
                            }
                        }
                    }
                }
            }
        }
    }
    func reloadData(){
        collectionHeroPool.reloadData()
        collectionTeam1Picks.reloadData()
        collectionTeam2Picks.reloadData()
        collectionTeam1Bans.reloadData()
        collectionTeam2Bans.reloadData()
        
        if turn == 1 { undoButtonOutlet.setTitle("Back to Maps", for: UIControlState.normal)} else { undoButtonOutlet.setTitle("Undo", for: UIControlState.normal)}
    }
    
    
    func turnController2(_ hero: Hero){
        
        switch turn {
        case 1: //Ban
            banHero(hero)
            switchTeam()
            draftStatus.text = "Team 2 Ban 1"
            //checkTeam()
        case 2: //Ban
            banHero(hero)
            switchTeam()
            draftStatus.text = "Team 1 Pick 1"
        case 3:
            pickHero(hero)
            switchTeam()
            draftStatus.text = "Team 2 Pick 1"
        case 4:
            pickHero(hero)
            draftStatus.text = "Team 2 Pick 2"
            
        case 5:
            pickHero(hero)
            draftStatus.text = "Team 1 Pick 2"
            switchTeam()
        case 6:
            pickHero(hero)
            
            draftStatus.text = "Team 1 Pick 3"
            
        case 7:
            pickHero(hero)
            switchTeam()
            draftStatus.text = "Team 2 Ban 2"
            
        case 8:
            banHero(hero)
            switchTeam()
            draftStatus.text = "Team 1 Ban 2"
        case 9:
            banHero(hero)
            switchTeam()
            draftStatus.text = "Team 2 Pick 3"
        case 10:
            pickHero(hero)
            
            draftStatus.text = "Team 2 Pick 4"
        case 11:
            pickHero(hero)
            switchTeam()
            draftStatus.text = "Team 1 Pick 4"
        case 12:
            pickHero(hero)
            
            draftStatus.text = "Team 1 Pick 5"
        case 13:
            pickHero(hero)
            switchTeam()
            draftStatus.text = "Team 2 Pick 5"
        case 14:
            pickHero(hero)
            draftStatus.text = "Fininshed Draft"
        default:
            print("Fininshed Draft")
        }
       
        
        
    }
    func undoPickValues() {
        
        for hero in team1 {
            hero.pickValue = hero.pickValueHistory.removeLast()
        }
        for hero in team2 {
            hero.pickValue = hero.pickValueHistory.removeLast()
        }
    }
    func undoPick(){
        
        switch turn {
        case 1, 2, 8, 9:
            if team1Active == true {
                team1Bans[turn] = dummyHero
            } else {
                team2Bans[turn] = dummyHero
            }
        case 3, 4, 5, 6, 7, 10, 11, 12, 13, 14:
            if team1Active == true {
                team1Picks[turn] = dummyHero
            } else {
                team2Picks[turn] = dummyHero
            }
        default:
            print("error in undoPick()")
        }
        
    }

    func undo(){
        
        //turn = turn - 1
        pickedHeroes.removeLast()
        undoPickValues()
        undoPick()
        reloadData()
    }
    
    func undoTurnController(_ hero: Hero){
        
        turn = turn - 1
        switch turn {
        case 0:
            self.navigationController?.popViewController(animated: true)
            self.navigationController?.isNavigationBarHidden = false
            //dismissViewControllerAnimated(false, completion: nil)
        case 1, 2, 3, 5, 7, 8, 9, 11, 13: //Ban
            switchTeam()
            undo()
            draftStatus.text = ""
        //checkTeam()
        case 4, 6, 10, 12, 14:
            undo()
            draftStatus.text = ""
        default:
            print("Fininshed Draft")
        }
    }
}


//func turnController(hero: Hero){
//    
//    if team1First == true {
//        switch turn {
//        case 1: //Ban
//            banTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 2 Ban 1"
//            checkTeam()
//        case 2: //Ban
//            banTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 1"
//            checkTeam()
//        case 3:
//            pickTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 1"
//            checkTeam()
//        case 4:
//            pickTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 2"
//            
//        case 5:
//            pickTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 2"
//            checkTeam()
//        case 6:
//            pickTeam1(hero)
//            draftStatus.text = "Team 1 Pick 3"
//            
//        case 7:
//            pickTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 2 Ban 2"
//            
//        case 8:
//            banTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 1 Ban 2"
//            checkTeam()
//        case 9:
//            banTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 3"
//        case 10:
//            pickTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 4"
//        case 11:
//            pickTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 4"
//        case 12:
//            pickTeam1(hero)
//            draftStatus.text = "Team 1 Pick 5"
//        case 13:
//            pickTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 5"
//        case 14:
//            pickTeam2(hero)
//            draftStatus.text = "Fininshed Draft"
//        default:
//            print("Fininshed Draft")
//        }
//    } else {
//        switch turn {
//        case 1: //Ban
//            banTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 1 Ban 1"
//        case 2: //Ban
//            banTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 1"
//        case 3:
//            pickTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 1"
//        case 4:
//            pickTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 2"
//        case 5:
//            pickTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 2"
//        case 6:
//            pickTeam2(hero)
//            draftStatus.text = "Team 2 Pick 3"
//        case 7:
//            pickTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 1 Ban 2"
//        case 8:
//            banTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 2 Ban 2"
//        case 9:
//            banTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 3"
//        case 10:
//            pickTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 4"
//        case 11:
//            pickTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 4"
//        case 12:
//            pickTeam2(hero)
//            draftStatus.text = "Team 2 Pick 5"
//        case 13:
//            pickTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 5"
//        case 14:
//            pickTeam1(hero)
//            draftStatus.text = "Fininshed Draft"
//        default:
//            print("Fininshed Draft")
//        }
//        
//    }
//    
//    
//    
//    
//    
//}

//func removeHero(inout heroArray: [Hero], heroToFilter: String){
//    let indexOfHeroToRemove = heroArray.indexOf({$0.hero.name.containsString("\(heroToFilter)") } )
//    heroArray.removeAtIndex(indexOfHeroToRemove!)
//}
//
//func team1Pick(hero: Hero){
//    findSynergy(team1, heroToFilter: hero.synergy, increment: 1)
//    findSynergy(team2, heroToFilter: hero.strong, increment: -1)
//    findSynergy(team2, heroToFilter: hero.weak, increment: 1)
//}
//func team2Pick(hero: Hero){
//    findSynergy(team2, heroToFilter: hero.synergy, increment: 1)
//    findSynergy(team1, heroToFilter: hero.strong, increment: -1)
//    findSynergy(team1, heroToFilter: hero.weak, increment: 1)
//}
//func banTeam1(hero: Hero){
//    recordPV()
//    //team1Bans.append(hero)
//    removeHero(&team1, heroToFilter: hero.hero.name)
//    removeHero(&team2, heroToFilter: hero.hero.name)
//    collectionHeroPool.reloadData()
//    collectionTeam1Bans.reloadData()
//    turn = turn + 1
//}
//func banTeam2(hero: Hero){
//    recordPV()
//    //team2Bans.append(hero)
//    removeHero(&team1, heroToFilter: hero.hero.name)
//    removeHero(&team2, heroToFilter: hero.hero.name)
//    collectionHeroPool.reloadData()
//    collectionTeam2Bans.reloadData()
//    turn = turn + 1
//}
//func pickTeam1(hero: Hero){
//    recordPV()
//    //team1Picks.append(hero)
//    //team1Pick(hero)
//    modifyPV(hero)
//    removeHero(&team1, heroToFilter: hero.hero.name)
//    removeHero(&team2, heroToFilter: hero.hero.name)
//    sortHeroes(&team1)
//    sortHeroes(&team2)
//    collectionHeroPool.reloadData()
//    collectionTeam1Picks.reloadData()
//    turn = turn + 1
//}
//func pickTeam2(hero: Hero){
//    recordPV()
//    //team2Picks.append(hero)
//    //team2Pick(hero)
//    modifyPV(hero)
//    removeHero(&team1, heroToFilter: hero.hero.name)
//    removeHero(&team2, heroToFilter: hero.hero.name)
//    sortHeroes(&team1)
//    sortHeroes(&team2)
//    collectionHeroPool.reloadData()
//    collectionTeam2Picks.reloadData()
//    turn = turn + 1
//}
//func relationshipsFunc(hero: Hero){
//    
//    //        switch team1Active {
//    //        case true:
//    //            findSynergy(team1, heroToFilter: hero.synergy, increment: 1)
//    //            findSynergy(team2, heroToFilter: hero.strong, increment: -1)
//    //            findSynergy(team2, heroToFilter: hero.weak, increment: 1)
//    //        default:
//    //            findSynergy(team2, heroToFilter: hero.synergy, increment: 1)
//    //            findSynergy(team1, heroToFilter: hero.strong, increment: -1)
//    //            findSynergy(team1, heroToFilter: hero.weak, increment: 1)
//    //        }
//    
//    findSynergy(activeTeam, heroToFilter: hero.synergy, increment: 1)
//    switchTeam()
//    findSynergy(activeTeam, heroToFilter: hero.strong, increment: -1)
//    findSynergy(activeTeam, heroToFilter: hero.weak, increment: 1)
//    switchTeam()
//    
//}
//func checkTeam(){
//    
//    if turn == 1 {
//        draftNotes.text = "\(activeTeam[0].hero.name)"
//    } else {
//        checkLoop: for hero in activeTeam {
//            for item in team1 {
//                if item === hero {
//                    activeTeam = team2
//                    draftNotes.text = "team2 is active \(activeTeam[0].hero.name)"
//                    break checkLoop
//                }
//            }
//            for item in team2 {
//                if item === hero {
//                    activeTeam = team1
//                    draftNotes.text = "team1 is active \(activeTeam[0].hero.name)"
//                    break checkLoop
//                }
//            }
//            
//        }
//    }
//}
////
////        if activeTeam == team1 {
////
////            activeTeam = team2
////            draftNotes.text = "team2 is active \(activeTeam[0].hero.name)"
////        } else if activeTeam == team2 {
////            activeTeam = team1
////            draftNotes.text = "team1 is active \(activeTeam[0].hero.name)"
////        }
//
//
//func switchTeam(){
//    
//    if team1Active == true {
//        activeTeam = team2
//        team1Active = false
//    } else if team1Active == false {
//        activeTeam = team1
//        team1Active = true
//    }
//    
//    //            checkLoop: for hero in activeTeam {
//    //                for item in team1 {
//    //                    if item === hero {
//    //                        activeTeam = team2
//    //                        draftNotes.text = "team2 is active \(activeTeam[0].hero.name)"
//    //                        break checkLoop
//    //                    }
//    //                }
//    //                for item in team2 {
//    //                    if item === hero {
//    //                        activeTeam = team1
//    //                        draftNotes.text = "team1 is active \(activeTeam[0].hero.name)"
//    //                        break checkLoop
//    //                    }
//    //                }
//    //            }
//    
//}
//
//
//
//func modifyPV(hero: Hero){
//    
//    for (key, value) in userOptions {
//        if key == "relationships" && value == true { relationshipsFunc(hero); print("called relationship")}
//        
//    }
//}
//
//func recordPV(){
//    for hero in team1{
//        hero.pickValueHistory.append(hero.pickValue)
//    }
//    for hero in team2{
//        hero.pickValueHistory.append(hero.pickValue)
//    }
//    
//}
//func undoBanTeam2(hero: Hero){
//    //team2Bans.append(hero)
//    removeHero(&team1, heroToFilter: hero.hero.name)
//    removeHero(&team2, heroToFilter: hero.hero.name)
//    collectionHeroPool.reloadData()
//    collectionTeam2Bans.reloadData()
//    turn = turn + 1
//}
//func undoPickTeam1(hero: Hero){
//    //team1Picks.append(hero)
//    //team1Pick(hero)
//    modifyPV(hero)
//    removeHero(&team1, heroToFilter: hero.hero.name)
//    removeHero(&team2, heroToFilter: hero.hero.name)
//    sortHeroes(&team1)
//    sortHeroes(&team2)
//    collectionHeroPool.reloadData()
//    collectionTeam1Picks.reloadData()
//    turn = turn + 1
//}
//func banHero(hero: Hero){
//    
//    recordPV()
//    pickedHeroes.append(hero)
//    
//    checkLoop: for heroObject in activeTeam {
//        for item in team1 {
//            if item === heroObject {
//                team1Bans[turn] = hero
//                if hero.hero.name == "Cho" {
//                    choLoop: for apple in team1 {
//                        if apple.hero.name == "Gall"{
//                            pickedHeroes.append(apple)
//                            break choLoop
//                        }
//                    }
//                } else if hero.hero.name == "Gall" {
//                    gallLoop: for apple in team1 {
//                        if apple.hero.name == "Cho"{
//                            pickedHeroes.append(apple)
//                            break gallLoop
//                        }
//                    }
//                }
//                
//                break checkLoop
//            }
//        }
//        for item in team2 {
//            if item === heroObject {
//                team2Bans[turn] = hero
//                if hero.hero.name == "Cho" {
//                    choLoop: for apple in team1 {
//                        if apple.hero.name == "Gall"{
//                            pickedHeroes.append(apple)
//                            break choLoop
//                        }
//                    }
//                } else if hero.hero.name == "Gall" {
//                    gallLoop: for apple in team1 {
//                        if apple.hero.name == "Cho"{
//                            pickedHeroes.append(apple)
//                            break gallLoop
//                        }
//                    }
//                }
//                
//                break checkLoop
//            }
//        }
//    }
//    
//    reloadData()
//    turn = turn + 1
//    
//}
//func pickHero(hero: Hero){
//    recordPV()
//    modifyPV(hero)
//    pickedHeroes.append(hero)
//    
//    checkLoop: for heroObject in activeTeam {
//        for item in team1 {
//            if item === heroObject {
//                team1Picks[turn] = hero
//                break checkLoop
//            }
//        }
//        for item in team2 {
//            if item === heroObject {
//                team2Picks[turn] = hero
//                break checkLoop
//            }
//        }
//    }
//    
//    
//    
//    
//    if (hero.hero.name == "Cho" || hero.hero.name == "Gall") && (turn == 4 || turn == 6 || turn == 10 || turn == 12) {
//        checkForChoGall(hero)
//    } else {
//        turn = turn + 1
//    }
//    reloadData()
//    
//    
//    
//}
//
//func checkForChoGall(hero: Hero){
//    print("checking for cho'gall")
//    print(hero.hero.name)
//    if hero.hero.name == "Cho" {
//        
//        print("found cho")
//        var gallHero: Hero!
//        checkLoop: for heroObject in activeTeam {
//            print("CHO CHECKLOOP")
//            for item in team1 {
//                if item === heroObject {
//                    print("TEAM1")
//                    for temp in team1{
//                        if temp.hero.name == "Gall" {
//                            turn = turn + 1
//                            gallHero = temp
//                            turnController2(gallHero)
//                            break checkLoop
//                        }
//                    }
//                }
//            }
//            for item in team2 {
//                if item === heroObject {
//                    print("TEAM2")
//                    for temp in team2{
//                        if temp.hero.name == "Gall" {
//                            turn = turn + 1
//                            gallHero = temp
//                            turnController2(gallHero)
//                            break checkLoop
//                        }
//                    }
//                }
//            }
//        }
//    } else if hero.hero.name == "Gall" {
//        print("found Gall")
//        var choHero: Hero!
//        checkLoop: for heroObject in activeTeam {
//            print("GALL CHECKLOOP")
//            for item in team1 {
//                if item === heroObject {
//                    print("TEAM 1")
//                    for temp in team1{
//                        if temp.hero.name == "Cho" {
//                            turn = turn + 1
//                            choHero = temp
//                            turnController2(choHero)
//                            break checkLoop
//                        }
//                    }
//                }
//            }
//            for item in team2 {
//                if item === heroObject {
//                    for temp in team2{
//                        print("TEAM 2")
//                        if temp.hero.name == "Cho" {
//                            turn = turn + 1
//                            choHero = temp
//                            turnController2(choHero)
//                            break checkLoop
//                        }
//                    }
//                }
//            }
//        }
//    }
//}
//func reloadData(){
//    collectionHeroPool.reloadData()
//    collectionTeam1Picks.reloadData()
//    collectionTeam2Picks.reloadData()
//    collectionTeam1Bans.reloadData()
//    collectionTeam2Bans.reloadData()
//}
//
//
//func turnController2(hero: Hero){
//    
//    switch turn {
//    case 1: //Ban
//        banHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 2 Ban 1"
//    //checkTeam()
//    case 2: //Ban
//        banHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 1 Pick 1"
//    case 3:
//        pickHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 2 Pick 1"
//    case 4:
//        pickHero(hero)
//        draftStatus.text = "Team 2 Pick 2"
//        
//    case 5:
//        pickHero(hero)
//        draftStatus.text = "Team 1 Pick 2"
//        switchTeam()
//    case 6:
//        pickHero(hero)
//        
//        draftStatus.text = "Team 1 Pick 3"
//        
//    case 7:
//        pickHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 2 Ban 2"
//        
//    case 8:
//        banHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 1 Ban 2"
//    case 9:
//        banHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 2 Pick 3"
//    case 10:
//        pickHero(hero)
//        
//        draftStatus.text = "Team 2 Pick 4"
//    case 11:
//        pickHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 1 Pick 4"
//    case 12:
//        pickHero(hero)
//        
//        draftStatus.text = "Team 1 Pick 5"
//    case 13:
//        pickHero(hero)
//        switchTeam()
//        draftStatus.text = "Team 2 Pick 5"
//    case 14:
//        pickHero(hero)
//        draftStatus.text = "Fininshed Draft"
//    default:
//        print("Fininshed Draft")
//    }
//    
//    
//    
//}
//
//
//func undoFunc(hero: Hero){
//    if team1First == true {
//        switch turn {
//        case 1: //Ban
//            banTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 2 Ban 1"
//        case 2: //Ban
//            banTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 1"
//        case 3:
//            pickTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 1"
//        case 4: //gets called on did select
//            //remove last picked hero
//            print("Removed Team 1 Pick 1")
//            
//        case 5:
//            pickTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 2"
//        case 6:
//            pickTeam1(hero)
//            draftStatus.text = "Team 1 Pick 3"
//        case 7:
//            pickTeam1(hero)
//            team1Active = true
//            draftStatus.text = "Team 2 Ban 2"
//        case 8:
//            banTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 1 Ban 2"
//        case 9:
//            banTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 3"
//        case 10:
//            pickTeam2(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 4"
//        case 11:
//            pickTeam2(hero)
//            team1Active = true
//            draftStatus.text = "Team 1 Pick 4"
//        case 12:
//            pickTeam1(hero)
//            draftStatus.text = "Team 1 Pick 5"
//        case 13:
//            pickTeam1(hero)
//            team1Active = false
//            draftStatus.text = "Team 2 Pick 5"
//        case 14:
//            pickTeam2(hero)
//            draftStatus.text = "Fininshed Draft"
//        default:
//            print("Fininshed Draft")
//        }
//    }
//    
//    
//    
//    
//}
//

//        let dummyTalent = Talent(id: "", name: "", talentDescription: "", cooldown: 0, prerequisite: "", icon: "")
//        let dummyAbility = Ability(id: "", name: "", abilityDescription: "", shortcut: "", cooldown: 0.0, manaCost: 0.0, manaCostPerSecond: 0.0, aimType: "", heroic: false, trait: false, mount: false, icon: "")
//        let dummyRatings = Ratings(damage: 0, utility: 0, survivability: 0, complexity: 0)
//        let dummyStats = Stats(hp: 0, hpPerLevel: 0, hpRegen: 0.0, hpRegenPerLevel: 0.0, mana: 0, manaPerLevel: 0, manaRegen: 0.0, manaRegenPerLevel: 0.0)
//
//        let dummyJsonHero = JsonHero(id: "", attributeId: "", name: "pickYourHero", title: "", heroDescription: "", role: "", type: "", gender: "", franchise: "", difficulty: "", icon: "", ratings: dummyRatings, stats: ["" : dummyStats], talents: ["" : [dummyTalent]], abilities: ["" : [dummyAbility]])


//        let dummyHero = Hero(hero: dummyJsonHero, synergy: [], strong: [], weak: [], map: [], tags: [], pickValue: 0, pickValueHistory: [], builds: [[:]], owned: false, favorite: false, inFreeHeroRotation: false)

