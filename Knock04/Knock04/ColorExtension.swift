//
//  ColorExtension.swift
//  Knock04
//
//  Created by Takuya OHASHI on 2017/09/18.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {

    public convenience init(colorWithHexValue hex6: UInt32) {
        let divisor = CGFloat(255)
        let red     = CGFloat((hex6 & 0xFF0000) >> 16) / divisor
        let green   = CGFloat((hex6 & 0x00FF00) >>  8) / divisor
        let blue    = CGFloat( hex6 & 0x0000FF       ) / divisor
        self.init(red: red, green: green, blue: blue, alpha: CGFloat(1))
    }
}
