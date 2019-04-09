//
//  CollectionViewController.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/9/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

private let reuseIdentifier = "collectionidentifier"

class CollectionViewController: UICollectionViewController {

    var pokemon: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for _ in 0...25 {
            pokemon.append("iVBORw0KGgoAAAANSUhEUgAAAGAAAABgBAMAAAAQtmoLAAAAMFBMVEUAAAAQEBAYSkoxc3M5lJRSYili1bRzrDGD7sWk1UGsADG9/3PNzc3uIDn/amL///87EAzGAAAAAXRSTlMAQObYZgAAAZ1JREFUWMPtlL9Lw0AUx9NUce1JwMGlLUfbrdAGcVAkl0fI5iSloxiOrg4hiJuWcP+AlPwLASm4lWzB0dG9/0HAunbwpbjfq6PcZ/5+8n5weZZlMBgMhv/F4b75KaOHj5L4ZppMWuT8Y1Gssge6gPmiSLKYINjtukBRvJ0kK5IQPrXHyGhwWxTZyz1BUGOlUjlQOyHRlwhDpSCUKq2FBWFqX6k5hKmU0Wkt6Hs6xwKgdsIqW8Q0IVQpoJBlSawdojmYKRz6+aMHXrYgCPZnqubh7HJZgtdPiALUwmYnTLTCxTpUoObrfAtCUISrZYAzRMtqCz7040S7pbM8kLjSvHoHANHXCx35C/Da0D8NfiyDO8yPGLjQhY7+dV/nUt512DdgiS4X+tfK/bzGBYEdcWhrhYbjv1aVC54D2BRBQAOnBeaAK7CKR/hHPYagwz0cgiAcyAg3KiQIhyZYrsQoD6I9BPAYh1oQQDlMgYw8K0Ch4bouRWhGtSCjll2WJeXqDYe8ZfUC7IYx0qlsMGbZm83Xfqee+HGDwWAwGP7KD5Vqm0oTWykbAAAAAElFTkSuQmCC")
        }
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        // Do any additional setup after loading the view.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return pokemon.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        let imageView = UIImageView(frame: CGRect(x: cell.frame.size.width / 5, y: 0, width: cell.frame.size.width, height: cell.frame.size.height))
        imageView.image = temp(pokemon[indexPath.row])
        
        cell.addSubview(imageView)
    
        return cell
    }
    
    func temp(_ base64String: String) -> UIImage {
        let dataDecoded:NSData = NSData(base64Encoded: base64String, options: NSData.Base64DecodingOptions(rawValue: 0))!
        return UIImage(data: dataDecoded as Data)!
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}
