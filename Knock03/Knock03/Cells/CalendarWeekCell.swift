//
//  CalenderWeekCell.swift
//  Knock03
//
//  Created by Takuya OHASHI on 2017/07/23.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class CalendarWeekCell: UICollectionViewCell {
    var weekLabel : UILabel!
    var weekday : WeekDay = .sunday {
        didSet {
            guard let week = weekLabel else {
                return
            }
            switch weekday {
            case .sunday, .saturday:
                week.textColor = UIColor.red
            default:
                week.textColor = UIColor.black
            }
            week.text = weekday.name
        }
    }

    enum WeekDay {
        case sunday
        case monday
        case tuesday
        case wednesday
        case thursday
        case friday
        case saturday

        var name : String {
            switch self {
            case .sunday:    return "Sun"
            case .monday:    return "Mon"
            case .tuesday:   return "Tue"
            case .wednesday: return "Wed"
            case .thursday:  return "Thu"
            case .friday:    return "Fri"
            case .saturday:  return "Sat"
            }
        }
    }

    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        createWeekLabel()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        createWeekLabel()
    }

    private func createWeekLabel() {
        weekLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        weekLabel.font = UIFont(name: "HiraKakuProN-W3", size: 12)
        weekLabel.textAlignment = .center

        self.addSubview(weekLabel)
    }

    func setWeekDay(at: Int) {
        switch at {
        case 0:
            weekday = .sunday
        case 1:
            weekday = .monday
        case 1:
            weekday = .monday
        case 2:
            weekday = .tuesday
        case 3:
            weekday = .wednesday
        case 4:
            weekday = .thursday
        case 5:
            weekday = .friday
        case 6:
            weekday = .saturday
        default:
            weekday = .sunday
        }
    }
}
