//
//  Pokemon.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/11/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import Foundation

struct Pokemon {
    init (_ dictionary: NSDictionary) {
        self.name = dictionary["name"] as! String
        self.types = dictionary["types"] as! [String]
        self.games = dictionary["games"] as! [String]
        self.generation = dictionary["generation"] as! Int
        self.image = dictionary["image"] as! String
        self.number = dictionary["pokemonNumber"] as! Int
    }
    
    let name: String
    let types: [String]
    let games: [String]
    let generation: Int
    let image: String
    let number: Int
}
