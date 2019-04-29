//
//  types-map.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/25/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import Foundation

class TypesMap {
    var typesChart = Dictionary<String, Dictionary<String, Double>>()
    init() {
        typesChart = addAll()
    }
    var types: [String] = [
        "Normal",
        "Fire",
        "Water",
        "Electric",
        "Grass",
        "Ice",
        "Fighting",
        "Poison",
        "Ground",
        "Flying",
        "Psychic",
        "Bug",
        "Rock",
        "Ghost",
        "Dragon",
        "Dark",
        "Steel",
        "Fairy"
    ]
    
    func addType(type name: String, _ map: Dictionary<String, Dictionary<String, Double>>, double listOfDouble: [String], half listOfHalf: [String], _ listOfNot: [String]? = nil) -> Dictionary<String, Dictionary<String, Double>> {
        var copy = map
        var normal = Dictionary<String, Double>()
        normal = addValue(listOfHalf, normal, 0.5)
        normal = addValue(listOfDouble, normal, 2)
        if let not = listOfNot {
            normal = addValue(not, normal, 0)
        }
        copy[name] = normal
        return copy
    }
    func addValue(_ listOfValues: [String], _ map: Dictionary<String, Double>, _ value: Double) -> Dictionary<String, Double> {
        var copy = map
        for item in listOfValues {
            copy[item] = value;
        }
        return copy
    }
    func addAll() -> Dictionary<String, Dictionary<String, Double>> {
        var map = Dictionary<String, Dictionary<String, Double>>()
        map = addType(type: "Normal", map, double: [], half: ["Rock", "Steel"], ["Ghost"])
        map = addType(type: "Fire", map, double: ["Grass", "Ice", "Bug", "Steel"], half: ["Fire", "Water", "Rock", "Dragon"])
        map = addType(type: "Water", map, double: ["Fire", "Ground", "Rock"], half: ["Water", "Grass", "Dragon"])
        map = addType(type: "Electric", map, double: ["Water", "Flying"], half: ["Electric", "Grass", "Dragon"], ["Ground"])
        map = addType(type: "Grass", map, double: ["Water", "Ground", "Rock"], half: ["Fire", "Grass", "Poison", "Flying", "Bug", "Dragon", "Steel"])
        map = addType(type: "Ice", map, double: ["Grass", "Ground", "Flying", "Dragon"], half: ["Fire", "Water", "Ice", "Steel"])
        map = addType(type: "Fighting", map, double: ["Normal", "Ice", "Rock", "Dark", "Steel"], half: ["Poison", "Flying", "Psychic", "Bug", "Fairy"], ["Ghost"])
        map = addType(type: "Poison", map, double: ["Grass", "Fairy"], half: ["Poison", "Ground", "Rock", "Ghost"], ["Steel"])
        map = addType(type: "Ground", map, double: ["Fire", "Electric", "Poison", "Rock", "Steel"], half: ["Grass", "Bug"], ["Flying"])
        map = addType(type: "Flying", map, double: ["Grass", "Fighting", "Bug"], half: ["Electric", "Rock", "Steel"])
        map = addType(type: "Psychic", map, double: ["Fighting", "Poison"], half: ["Psychic", "Steel"], ["Dark"])
        map = addType(type: "Bug", map, double: ["Grass", "Psychic", "Dark"], half: ["Fire", "Fighting", "Poison", "Flying", "Ghost", "Steel", "Fairy"])
        map = addType(type: "Rock", map, double: ["Fire", "Ice", "Flying", "Bug"], half: ["Fighting", "Ground", "Steel"])
        map = addType(type: "Ghost", map, double: ["Ghost", "Psychic"], half: ["Dark"], ["Normal"])
        map = addType(type: "Dragon", map, double: ["Dragon"], half: ["Steel"], ["Fairy"])
        map = addType(type: "Dark", map, double: ["Psychic", "Ghost"], half: ["Fighting", "Dragon", "Fairy"])
        map = addType(type: "Steel", map, double: ["Ice", "Fairy"], half: ["Fire", "Water", "Electric", "Steel"])
        map = addType(type: "Fairy", map, double: ["Fighting", "Dragon", "Dark"], half: ["Fire", "Poison", "Steel"])
        return map
    }
}
