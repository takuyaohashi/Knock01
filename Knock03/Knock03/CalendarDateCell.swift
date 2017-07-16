//
//  CalendarDateCell.swift
//  Knock03
//
//  Created by Takuya OHASHI on 2017/07/16.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import Foundation
import UIKit

class CalendarCell: UICollectionViewCell {
    var date : UILabel!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!

        createDate()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        createDate()
    }

    func createDate() {
        date = UILabel(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height))
        date.text = ""
        date.textColor = UIColor.white

        self.addSubview(date)
    }
}
