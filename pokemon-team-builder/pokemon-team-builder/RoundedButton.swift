//
//  RoundedButton.swift
//  pokemon-team-builder
//
//  Created by Judah Goff on 4/23/19.
//  Copyright © 2019 Judah Goff. All rights reserved.
//

import UIKit

@IBDesignable class RoundedButton: UIButton {
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateCornerRadius()
    }
    
    @IBInspectable var rounded: Bool = false {
        didSet {
            updateCornerRadius()
        }
    }
    
    func updateCornerRadius() {
        layer.cornerRadius = rounded ? frame.size.height / 2 : 0
    }
}
