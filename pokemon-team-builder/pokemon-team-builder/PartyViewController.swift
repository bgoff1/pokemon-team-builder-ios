//
//  PartyViewController.swift
//  pokemon-team-builder
//
//  Created by Sam Dillin on 4/23/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    
    
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
    
    
    
    var party = PartyData()
    
    var partyNameLabels : [UILabel] = []
    var partyImageButtons : [UIButton] = []
    var partyTypeBox : [UILabel] = []
    
    var TypeButton : [UIButton] = []
    var TypeLabel : [UILabel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
          setupArrays()
        party.loadPartyFromUserDefaults()
        var loadedParty = party.getParty()
        print(party.partySize())
        if party.partySize() > 0 {
            for count in 0...party.partySize()-1{
                partyNameLabels[count].text = loadedParty[count].name
                partyImageButtons[count].setImage(getImageFromString(loadedParty[count].image), for: .normal)
            }
        }
        
      
//        for item in party.getParty() {
//            if item.isType("Flying") {
//            }
//        }
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
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
