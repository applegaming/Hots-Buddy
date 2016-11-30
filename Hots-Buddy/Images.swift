//
//  Images.swift
//  Hots-Buddy
//
//  Created by Alexander Appugliese on 11/29/16.
//  Copyright © 2016 AppleGaming. All rights reserved.
//

import Foundation
import UIKit

let directories = ["Portraits", "Ability Icons", "Talent Icons", "Skins", "Busts"]

//Save Image At Document Directory
func saveImageCachesDirectory(fileName: String, subdirectory: String, image: Data){
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(subdirectory)/\(fileName)")
    print(paths)
    //let imageData = UIImageJPEGRepresentation(image!, 0.5)
    //let imageData = UIImagePNGRepresentation(image)
    fileManager.createFile(atPath: paths as String, contents: image, attributes: nil) // contents is expected to be of type "Data"
}

//Get Document Directory Path
func getDirectoryPath() -> String {
    let paths = NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)
    let documentsDirectory = paths[0]
    return documentsDirectory
}

//Get Image from Document Directory
func getImage(fileName: String, subdirectory: String) -> UIImage {
    let fileManager = FileManager.default
    let imagePAth = (getDirectoryPath() as NSString).appendingPathComponent("\(subdirectory)/\(fileName)")
    if fileManager.fileExists(atPath: imagePAth) {
        return UIImage(contentsOfFile: imagePAth)!
    } else {
        print("No Image")
    }
    return UIImage(named: "pickYourHero")!
}

//Create Directory
func createDirectory(subdirectory: String){
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("\(subdirectory)")
    if !fileManager.fileExists(atPath: paths){
        try! fileManager.createDirectory(atPath: paths, withIntermediateDirectories: true, attributes: nil)
    }else{
        print("Directory Already Exists.")
    }
}

//Delete Directory
func deleteDirectory(){
    let fileManager = FileManager.default
    let paths = (NSSearchPathForDirectoriesInDomains(.cachesDirectory, .userDomainMask, true)[0] as NSString).appendingPathComponent("customDirectory")
    if fileManager.fileExists(atPath: paths){
        try! fileManager.removeItem(atPath: paths)
    }else{
        print("Something wrong.")
    }
}

func createImageDirectories(){
    
    for item in directories {
        createDirectory(subdirectory: "\(item)")
    }
}

func getAllImages(_ callback: @escaping () -> Void ){
    
    let fileManager = FileManager.default
    
    
    for hero in heroes {
     
        //Portraits
        var imagePAth = (getDirectoryPath() as NSString).appendingPathComponent("Portraits/\(hero.hero.name)")
        if !fileManager.fileExists(atPath: imagePAth) {
            getUrlImage(urlString: nameToLink(hero: hero, imageToGet: "portrait")) { responseData in              saveImageCachesDirectory(fileName: hero.hero.name, subdirectory: "Portraits", image: responseData)
            }
        }

        //Talents
        for (_, talents) in hero.hero.talents {
            for talent in talents {
                imagePAth = (getDirectoryPath() as NSString).appendingPathComponent("Talent Icons/\(talent.name)")
                if !fileManager.fileExists(atPath: imagePAth) {
                    getUrlImage(urlString: talent.image) { responseData in
                        saveImageCachesDirectory(fileName: talent.name, subdirectory: "Talent Icons", image: responseData)
                    }
                }
            }
        }

        //Abilities
        for ability in hero.hero.abilities {
            imagePAth = (getDirectoryPath() as NSString).appendingPathComponent("Ability Icons/\(ability.name)")
            if !fileManager.fileExists(atPath: imagePAth) {
                getUrlImage(urlString: ability.image) { responseData in
                    saveImageCachesDirectory(fileName: ability.name, subdirectory: "Ability Icons", image: responseData)
                }
            }
        }

        //Skins
        
        
        //Busts
        imagePAth = (getDirectoryPath() as NSString).appendingPathComponent("Busts/\(hero.hero.name)")
        if !fileManager.fileExists(atPath: imagePAth) {
            getUrlImage(urlString: nameToLink(hero: hero, imageToGet: "bust")) { responseData in              saveImageCachesDirectory(fileName: hero.hero.name, subdirectory: "Busts", image: responseData)
            }
        }
    }
    
    callback()
}
