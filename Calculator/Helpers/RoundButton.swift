//
//  RoundButton.swift
//  Calculator
//
//  Created by Steve Lederer on 12/31/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class RoundButton: UIButton {

    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        let radius = self.bounds.size.height / 2
        self.layer.cornerRadius = radius
    }
}
