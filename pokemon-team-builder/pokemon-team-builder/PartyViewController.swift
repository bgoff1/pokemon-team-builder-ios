//
//  PartyViewController.swift
//  pokemon-team-builder
//
//  Created by Sam Dillin on 4/23/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    
    let pokeballImage = UIImage(named: "Pokeball small")
    
    @IBOutlet weak var partyNameLabel1: UILabel!
    @IBOutlet weak var partyNameLabel2: UILabel!
    @IBOutlet weak var partyNameLabel3: UILabel!
    @IBOutlet weak var partyNameLabel4: UILabel!
    @IBOutlet weak var partyNameLabel5: UILabel!
    @IBOutlet weak var partyNameLabel6: UILabel!
    
    @IBOutlet weak var partyImageButton1: UIButton!
    @IBOutlet weak var partyImageButton2: UIButton!
    @IBOutlet weak var partyImageButton3: UIButton!
    @IBOutlet weak var partyImageButton4: UIButton!
    @IBOutlet weak var partyImageButton5: UIButton!
    @IBOutlet weak var partyImageButton6: UIButton!
    
    @IBOutlet weak var partyTypeBox1: UILabel!
    @IBOutlet weak var partyTypeBox2: UILabel!
    @IBOutlet weak var partyTypeBox3: UILabel!
    @IBOutlet weak var partyTypeBox4: UILabel!
    @IBOutlet weak var partyTypeBox5: UILabel!
    @IBOutlet weak var partyTypeBox6: UILabel!
    
    @IBOutlet weak var TypeButton1: RoundedButton! //Normal
    @IBOutlet weak var TypeButton2: RoundedButton! //Fighting
    @IBOutlet weak var TypeButton3: RoundedButton! //Flying
    @IBOutlet weak var TypeButton4: RoundedButton! //Poison
    @IBOutlet weak var TypeButton5: RoundedButton! //Ground
    @IBOutlet weak var TypeButton6: RoundedButton! //Rock
    @IBOutlet weak var TypeButton7: RoundedButton! //Bug
    @IBOutlet weak var TypeButton8: RoundedButton! //Ghost
    @IBOutlet weak var TypeButton9: RoundedButton! //Steel
    
    @IBOutlet weak var TypeLabel1: UILabel!
    @IBOutlet weak var TypeLabel2: UILabel!
    @IBOutlet weak var TypeLabel3: UILabel!
    @IBOutlet weak var TypeLabel4: UILabel!
    @IBOutlet weak var TypeLabel5: UILabel!
    @IBOutlet weak var TypeLabel6: UILabel!
    @IBOutlet weak var TypeLabel7: UILabel!
    @IBOutlet weak var TypeLabel8: UILabel!
    @IBOutlet weak var TypeLabel9: UILabel!
    
    @IBOutlet weak var TypeButton10: RoundedButton! //Fire
    @IBOutlet weak var TypeButton11: RoundedButton! //Water
    @IBOutlet weak var TypeButton12: RoundedButton! //Grass
    @IBOutlet weak var TypeButton13: RoundedButton! //Electric
    @IBOutlet weak var TypeButton14: RoundedButton! //Psychic
    @IBOutlet weak var TypeButton15: RoundedButton! //Ice
    @IBOutlet weak var TypeButton16: RoundedButton! //Dragon
    @IBOutlet weak var TypeButton17: RoundedButton! //Dark
    @IBOutlet weak var TypeButton18: RoundedButton! //Fairy
    
    @IBOutlet weak var TypeLabel10: UILabel!
    @IBOutlet weak var TypeLabel11: UILabel!
    @IBOutlet weak var TypeLabel12: UILabel!
    @IBOutlet weak var TypeLabel13: UILabel!
    @IBOutlet weak var TypeLabel14: UILabel!
    @IBOutlet weak var TypeLabel15: UILabel!
    @IBOutlet weak var TypeLabel16: UILabel!
    @IBOutlet weak var TypeLabel17: UILabel!
    @IBOutlet weak var TypeLabel18: UILabel!
    
    
    @IBOutlet weak var strengthsWeaknesses: UISegmentedControl!
    
    var party = PartyData()
    var typesMap = TypesMap()
    
    var labelValues = Dictionary<String, Int>()
    var memberValues = Dictionary<String, Int>()
    
    var partyNameLabels : [UILabel] = []
    var partyImageButtons : [UIButton] = []
    var partyTypeBox : [UILabel] = []
    
    var TypeButton : [UIButton] = []
    var TypeLabel : [UILabel] = []
    
    var selectedMemberIndex: Int?
    var backupTypeMap: Dictionary<String, Int>?
    
    @IBAction func flipToggle(_ sender: UISegmentedControl) {
        resetMatchupDictionary()
        clearLabelBackgrounds()
        
        if sender.selectedSegmentIndex == 0 {
            checkAttackers()
        } else if sender.selectedSegmentIndex == 1 {
            checkDefenders()
        }
        
        updateTypeLabels()
    }
    
    @IBAction func CheckPartyMember(_ sender: UIButton) {
        clearLabelBackgrounds()
        
        if selectedMemberIndex != sender.tag {
            selectedMemberIndex = sender.tag
            if strengthsWeaknesses.selectedSegmentIndex == 0 {
                highlightLabels(findAttackModifiers(sender.tag))
                backupTypeMap = labelValues
                resetMatchupDictionary()
                checkOneAttacker(party.getMember(at: sender.tag))
                updateTypeLabels()
            } else if strengthsWeaknesses.selectedSegmentIndex == 1 {
                highlightLabels(findDefenseModifier(sender.tag))
                backupTypeMap = labelValues
                resetMatchupDictionary()
                checkOneDefender(party.getMember(at: sender.tag))
                updateTypeLabels()
            }
        } else {
            selectedMemberIndex = nil
            labelValues = backupTypeMap!
            backupTypeMap = nil
            updateTypeLabels()
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setupArrays()
        party.loadPartyFromUserDefaults()
        var loadedParty = party.getParty()
        print (loadedParty.count)
        
        if party.partySize() != 0 {
            for count in 0...party.partySize() - 1 {
                partyNameLabels[count].text = loadedParty[count].name
                partyImageButtons[count].setImage(getImageFromString(loadedParty[count].image), for: .normal)
                partyTypeBox[count].backgroundColor = .lightGray
            }
        }
        for count in party.partySize()..<6 {
            partyNameLabels[count].text = " "
            partyImageButtons[count].setImage(pokeballImage, for: .normal)
            partyTypeBox[count].backgroundColor = .lightGray
        }
        
        checkAttackers()
        updateTypeLabels()
    }
    
    func updateTypeLabels() {
        for value in labelValues {
            TypeLabel[getTagName(value.key)].text! = String(value.value)
        }
    }
    
    func findAttackModifiers(_ partyIndex: Int) -> [String] {
        let partyMember = party.getMember(at: partyIndex)
        var attackModifiers: [String] = []
        
        for type in partyMember.types {
            if type.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                for mult in typesMap.typesChart {
                    if mult.key == type {
                        for m in mult.value {
                            if m.value == 2 {
                                if(!attackModifiers.contains(m.key) ){
                                    attackModifiers.append(m.key)
                                }
                            } else if m.value == 0.5 {
                                if !attackModifiers.contains(m.key) {
                                    attackModifiers.append(m.key)
                                }
                            }
                        }
                    }
                }
            }
        }
        
        return attackModifiers
    }
    
    func findDefenseModifier(_ partyIndex: Int) -> [String] {
        
        let partyMember = party.getMember(at: partyIndex)
        var defenseModifiers: [String] = []
        
        for type in partyMember.types {
            if type.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                for mult in typesMap.typesChart {
                    for m in mult.value {
                        if m.key == type {
                            if m.value == 2 {
                                if !defenseModifiers.contains(mult.key) {
                                    defenseModifiers.append(mult.key)
                                }
                            }
                        }
                    }
                }
            }
        }
        return defenseModifiers
    }
    
    func highlightLabels(_ typesToHighlight: [String]) {
        for label in typesToHighlight {
            TypeLabel[getTagName(label)].backgroundColor = .yellow
        }
    }
    
    func clearLabelBackgrounds() {
        for label in TypeLabel {
            label.backgroundColor = .clear
        }
    }
    
    func resetMatchupDictionary() {
        for type in typesMap.types {
            labelValues[type] = 0
        }
    }
    
    func checkAttackers() {
        // for each pokemon in the party
        for item in party.getParty() {
            // for each of that pokemon's types
            checkOneAttacker(item)
        }
        updateTypeLabels()
    }
    
    func checkOneAttacker(_ partyMember: Pokemon) {
        for type in partyMember.types {
            // if it is a type
            if type.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                // loop through all of the types
                // mult = attackers to str & wknses
                for mult in typesMap.typesChart {
                    // and all other types
                    if mult.key == type {
                        for m in mult.value {
                            if m.value == 2 {
                                labelValues[m.key] = (labelValues[m.key] ?? 1) + 1
                            } else if m.value == 0.5 {
                                labelValues[m.key] = (labelValues[m.key] ?? -1) - 1
                            }
                        }
                    }
                }
            }
        }
    }
    
    func checkOneDefender(_ partyMember: Pokemon) {
        for type in partyMember.types {
            // if it is a type
            if type.trimmingCharacters(in: .whitespacesAndNewlines) != "" {
                // loop through all of the types
                // mult = attackers to str & wknses
                for mult in typesMap.typesChart {
                    // and all other types
                    for m in mult.value {
                        if m.key == type {
                            if m.value == 2 {
                                labelValues[mult.key] = (labelValues[mult.key] ?? 1) - 1
                            }
                        }
                    }
                }
            }
        }
    }
    
    func checkDefenders() {
        // for each pokemon in the party
        for item in party.getParty() {
            // for each of that pokemon's types
            checkOneDefender(item)
        }
        updateTypeLabels()
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
    
    func setupArrays(){
        partyNameLabels = [partyNameLabel1, partyNameLabel2, partyNameLabel3,
                           partyNameLabel4, partyNameLabel5, partyNameLabel6]
        
        
        partyImageButtons = [partyImageButton1, partyImageButton2, partyImageButton3,
                             partyImageButton4, partyImageButton5, partyImageButton6]
        
        
        partyTypeBox = [partyTypeBox1, partyTypeBox2, partyTypeBox3,
                        partyTypeBox4, partyTypeBox5, partyTypeBox6]
        
        
        TypeButton = [TypeButton1, TypeButton2, TypeButton3,
                      TypeButton4, TypeButton5, TypeButton6,
                      TypeButton7, TypeButton8, TypeButton9,
                      TypeButton10 , TypeButton11, TypeButton12,
                      TypeButton13, TypeButton14, TypeButton15,
                      TypeButton16 , TypeButton17, TypeButton18]
        
        
        TypeLabel = [TypeLabel1, TypeLabel2, TypeLabel3,
                     TypeLabel4, TypeLabel5, TypeLabel6,
                     TypeLabel7, TypeLabel8, TypeLabel9,
                     TypeLabel10, TypeLabel11, TypeLabel12,
                     TypeLabel13, TypeLabel14, TypeLabel15,
                     TypeLabel16, TypeLabel17, TypeLabel18]
        resetMatchupDictionary()
    }
    
}
