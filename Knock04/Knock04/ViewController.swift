//
//  ViewController.swift
//  Knock04
//
//  Created by Takuya OHASHI on 2017/09/16.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import JTAppleCalendar

class ViewController: UIViewController {
    let formatter = DateFormatter()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

extension ViewController: JTAppleCalendarViewDelegate, JTAppleCalendarViewDataSource {

    func configureCalendar(_ calendar: JTAppleCalendarView) -> ConfigurationParameters {
        formatter.dateFormat = "yyyy MM dd"
        formatter.timeZone = Calendar.current.timeZone
        formatter.locale   = Calendar.current.locale

        let startDate = formatter.date(from: "2017 01 01")!
        let endDate = formatter.date(from: "2017 12 31")!

        let parameters = ConfigurationParameters(startDate: startDate, endDate: endDate)
        return parameters
    }

    func calendar(_ calendar: JTAppleCalendarView, cellForItemAt date: Date, cellState: CellState, indexPath: IndexPath) -> JTAppleCell {
        let cell = calendar.dequeueReusableJTAppleCell(withReuseIdentifier: "CutomCell", for: indexPath) as! CustomCell
        cell.dateLabel.text = cellState.text
        return cell
    }
}
