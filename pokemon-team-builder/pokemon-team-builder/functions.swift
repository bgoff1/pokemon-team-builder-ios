//
//  functions.swift
//  pokemon-team-builder
//
//  Created by Sam Dillin on 4/25/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import Foundation
import UIKit
func getImageFromString(_ text:String) -> UIImage{
    
    let dataDecoded = Data(base64Encoded: text, options: .ignoreUnknownCharacters)!
    let decodedImage = UIImage(data: dataDecoded)!
    
    return decodedImage
}

func getTagName(_ type: String) -> Int {
    switch (type) {
    case "Normal":
        return 0
    case "Fire":
        return 9
    case "Water":
        return 10
    case "Electric":
        return 12
    case "Grass":
        return 11
    case "Ice":
        return 14
    case "Fighting":
        return 1
    case "Poison":
        return 3
    case "Ground":
        return 4
    case "Flying":
        return 2
    case "Psychic":
        return 13
    case "Bug":
        return 6
    case "Rock":
        return 5
    case "Ghost":
        return 7
    case "Dragon":
        return 15
    case "Dark":
        return 16
    case "Steel":
        return 8
    case "Fairy":
        return 17
    default: return -1
    }
}

func getTypeFromTag(_ tag: Int) -> String {
    switch (tag) {
    case 0:
        return "Normal"
    case 1:
        return "Fighting"
    case 2: return "Flying"
    case 3: return "Poison"
    case 4: return "Ground"
    case 5: return "Rock"
    case 6: return "Bug"
    case 7: return "Ghost"
    case 8: return "Steel"
    case 9: return "Fire"
    case 10: return "Water"
    case 11: return "Grass"
    case 12: return "Electric"
    case 13: return "Psychic"
    case 14: return "Ice"
    case 15: return "Dragon"
    case 16: return "Dark"
    case 17: return "Fairy"
    default: return ""
    }
}
