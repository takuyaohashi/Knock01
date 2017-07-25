//
//  CalenderWeekCell.swift
//  Knock03
//
//  Created by Takuya OHASHI on 2017/07/23.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class CalendarWeekCell: UICollectionViewCell {
    var week : UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createWeekLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        createWeekLabel()
    }

    func createWeekLabel() {
        week = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        week.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        week.textAlignment = .center

        self.addSubview(week)
    }
}
