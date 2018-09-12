//
//  UIButton.swift
//  GoalPost-app
//
//  Created by Ahmed Waheed on 8/30/18.
//  Copyright © 2018 Ahmed Waheed. All rights reserved.
//  we make that file to exchange the color of our selection buttons

import UIKit

extension UIButton {
    func setSelectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.3016467392, green: 0.7468368411, blue: 0.3395946622, alpha: 1)
    }
    
    func setDeselectedColor() {
        self.backgroundColor = #colorLiteral(red: 0.6506131291, green: 0.8722513318, blue: 0.6690511107, alpha: 1)
    }
}

