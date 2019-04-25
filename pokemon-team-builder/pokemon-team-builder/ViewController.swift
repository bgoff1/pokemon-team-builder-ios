//
//  ViewController.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/9/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var partyMemberOne: UIButton!
    @IBOutlet weak var partyMemberTwo: UIButton!
    @IBOutlet weak var partyMemberThree: UIButton!
    @IBOutlet weak var partyMemberFour: UIButton!
    @IBOutlet weak var partyMemberFive: UIButton!
    @IBOutlet weak var partyMemberSix: UIButton!
    
    var buttons: [UIButton] = []
    var party = PartyData()
    let pokeballImage = UIImage(named: "Pokeball small")?.addImagePadding(x: 46, y: 46)
    
    @IBAction func removePokemonFromParty(_ sender: UIButton) {
        if (sender.currentImage != pokeballImage) {
            sender.setImage(pokeballImage, for: [])
            if sender.tag - 1 > party.partySize() - 1 {
                party.removeMember(at: party.partySize() - 1)
                
                updateButtons()
            } else {
                party.removeMember(at: sender.tag - 1)
                
                updateButtons()
            }
        }
    }
    var dataArray: [Pokemon] = []
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDataToArray()
        
        self.collectionView.dataSource = self
        
        // Register cells
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        
        // Setup Grid View
        self.setupGridView()
        
        self.collectionView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tap)))
        
        for button in buttons {
            button.setImage(pokeballImage, for: [])
            print(button.image(for: .normal)!.size)
        }
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        
        buttons = [partyMemberOne, partyMemberTwo, partyMemberThree, partyMemberFour, partyMemberFive, partyMemberSix]
    }
    
    @objc func tap(sender: UITapGestureRecognizer) {
        if let indexPath = self.collectionView?.indexPathForItem(at: sender.location(in: self.collectionView)) {
            print(dataArray[indexPath.row].name)
            print(party.partySize())
            if (party.partySize() < 6) {
                party.addPokemon(dataArray[indexPath.row])
                updateButtons()
            }
        }
    }
    

    
    func updateButtons() {
        for count in 0...buttons.count-1{
            if count <= party.partySize() - 1 {
                buttons[count].setImage(getImageFromString(party.getMember(at: count).image), for: .normal)
            }
            else{
                buttons[count].setImage(pokeballImage, for: .normal)
            }
        }
    }
    
    
    
    func addDataToArray() {
        if let path = Bundle.main.path(forResource: "pokemon", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableLeaves)
                
                if let jsonDictionary = json as? Dictionary<String, AnyObject> {
                    if let pokemon = jsonDictionary["pokemon"] as? [AnyObject] {
                        for poke in pokemon {
                            let item = Pokemon.init(poke as! NSDictionary)
                            dataArray.append(item)
                        }
                    }
                }
            }
            catch {
                print("error")
            }
        }
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.dataArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        
        cell.setData(text: self.dataArray[indexPath.row].image)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWidth()
        return CGSize(width: width, height: width)
    }
    
    func calculateWidth() -> CGFloat {
        let estimatedWidth = CGFloat(estimateWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        
        return width
    }
}
