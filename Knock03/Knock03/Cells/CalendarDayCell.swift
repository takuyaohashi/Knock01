//
//  CalendarDayCell.swift
//  Knock03
//
//  Created by Takuya OHASHI on 2017/07/23.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class CalendarDayCell: UICollectionViewCell {
    var day : UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createDayLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        createDayLabel()
    }

    func createDayLabel() {
        day = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        day.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        day.textAlignment = .center

        self.addSubview(day)
    }
}
