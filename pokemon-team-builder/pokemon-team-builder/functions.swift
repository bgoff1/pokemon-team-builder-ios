//
//  functions.swift
//  pokemon-team-builder
//
//  Created by Sam Dillin on 4/25/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import Foundation
import UIKit
func getImageFromString(_ text:String) -> UIImage{
    
    let dataDecoded = Data(base64Encoded: text, options: .ignoreUnknownCharacters)!
    let decodedImage = UIImage(data: dataDecoded)!
    
    print (decodedImage.size)
    
    return decodedImage
}
