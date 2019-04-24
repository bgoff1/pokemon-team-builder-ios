//
//  PartyViewController.swift
//  pokemon-team-builder
//
//  Created by Sam Dillin on 4/23/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

class PartyViewController: UIViewController {
    
    var party = PartyData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        party.loadPartyFromUserDefaults()
        print(party.partySize())
        if party.partySize() > 0 {
        }
//        for item in party.getParty() {
//            if item.isType("Flying") {
//            }
//        }
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
