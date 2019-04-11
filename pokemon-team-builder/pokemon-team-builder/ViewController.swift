//
//  ViewController.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/9/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var partyCollectionView: UICollectionView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var dataArray: [Pokemon] = []
    
    var estimateWidth = 160.0
    var cellMarginSize = 16.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addDataToArray()
        
        //self.collectionView.delegate = self
        self.collectionView.dataSource = self
        //        self.partyCollectionView.dataSource = self
        
        // Register cells
        self.collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")
        //        self.partyCollectionView.register(UINib(nibName: "PartyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "PartyCollectionViewCell")
        
        // Setup Grid View
        self.setupGridView()
    }
    
    func setupGridView() {
        let flow = collectionView?.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumInteritemSpacing = CGFloat(self.cellMarginSize)
        flow.minimumLineSpacing = CGFloat(self.cellMarginSize)
        
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
    
    /*
     func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
     print("User tapped on pokemon \(dataArray[indexPath.row].name)")
     }
     */
    
}
