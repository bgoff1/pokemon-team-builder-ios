//
//  CollectionViewCell.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/11/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setData(text: String) {
        let dataDecoded = Data(base64Encoded: text, options: .ignoreUnknownCharacters)!
        let decodedImage = UIImage(data: dataDecoded)!
        self.imageView.image = decodedImage
    }
    
}
