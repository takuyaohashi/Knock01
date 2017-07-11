//
//  ViewController.swift
//  Knock03
//
//  Created by Takuya OHASHI on 2017/07/11.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var calendarView : UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "calendar"

        createCalendar()
    }
    
    func createCalendar() {
        calendarView = UICollectionView(frame: UIScreen.main.nativeBounds,
                                        collectionViewLayout: UICollectionViewLayout())
        calendarView.backgroundColor = UIColor.lightGray
        self.view.addSubview(calendarView)
        
        calendarView.translatesAutoresizingMaskIntoConstraints = false

        self.view.addConstraints([
        
            NSLayoutConstraint(item: calendarView,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.topLayoutGuide,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),

            NSLayoutConstraint(item: calendarView,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .width,
                               multiplier: 1.0,
                               constant: 0),
            
            NSLayoutConstraint(item: calendarView,
                               attribute: .bottom,
                               relatedBy: .equal,
                               toItem: self.view,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 0),
            
        ]);
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

//
//extension ViewController: UICollectionViewDataSource {

    

//}
