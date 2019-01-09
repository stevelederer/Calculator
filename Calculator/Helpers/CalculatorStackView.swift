//
//  CalculatorStackView.swift
//  Calculator
//
//  Created by Steve Lederer on 1/8/19.
//  Copyright © 2019 Steve Lederer. All rights reserved.
//

import UIKit

class CalculatorStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alignment = .fill
        self.distribution = .fillEqually
        self.axis = .horizontal
        self.spacing = 16
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

