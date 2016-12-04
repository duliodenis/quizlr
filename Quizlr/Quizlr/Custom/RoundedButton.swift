//
//  RoundedButton.swift
//  Quizlr
//
//  Created by Dulio Denis on 12/4/16.
//  Copyright © 2016 Dulio Denis. All rights reserved.
//

import UIKit

class RoundedButton: UIButton {

    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // round the edges by five pixels
        layer.cornerRadius = 5.0
        // clip sublayers to the layer's bound
        layer.masksToBounds = true
    }

}
