//
//  PartyData.swift
//  pokemon-team-builder
//
//  Created by Sam Dillin on 4/23/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import Foundation


class PartyData{
    let defaults = UserDefaults.standard
    private var party: [Pokemon] = []

    func addPokemon(_ pokemon: Pokemon) {
        party.append(pokemon)
        savePartyToUserDefaults()
    }
    
    func getParty() -> [Pokemon] {
        return party
    }
    
    func partySize() -> Int {
        return party.count
    }
    
    func getMember(at index: Int) -> Pokemon {
        return party[index]
    }
    
    func removeMember(at index: Int) {
        party.remove(at: index)
        savePartyToUserDefaults()
    }
    
    func clearParty() {
        party.removeAll()
        savePartyToUserDefaults()
    }
    
    func savePartyToUserDefaults(){
        var saveArray: [String] = []
        for single in party {
            let str1 = single.name
            let str2 = single.types[0]
            let str3 = single.types.count > 1 ? single.types[1] : ""
            let str4 = single.image
            let str5 = single.number
            let str6 = single.generation
            saveArray.append("\(str1)|\(str2)|\(str3)|\(str4)|\(str5)|\(str6)")
        }
        
        defaults.set(saveArray, forKey:"party")
        defaults.synchronize()
    }
    func loadPartyFromUserDefaults(){
        if let stringArray = defaults.array(forKey: "party") as? Array<String> {
            self.clearParty()
            for aString in stringArray{
                let components = aString.components(separatedBy:"|")
                let partyMember = Pokemon.init(name: components[0], types: [components[1], components[2]], image: components[3], number: Int(components[4])!, generation: Int(components[5])!)
                addPokemon(partyMember)
            }
        }
    }

}
