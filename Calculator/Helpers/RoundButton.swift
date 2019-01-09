//
//  RoundButton.swift
//  Calculator
//
//  Created by Steve Lederer on 12/31/18.
//  Copyright © 2018 Steve Lederer. All rights reserved.
//

import UIKit

class RoundButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor(named: "DarkGrayButtonColor")
        self.titleLabel?.font = UIFont.systemFont(ofSize: 35)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.masksToBounds = true
        let radius = self.bounds.size.height / 2
        self.layer.cornerRadius = radius
    }
}
