//
//  AddItemViewController.swift
//  Knock02
//
//  Created by Takuya OHASHI on 2017/07/08.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    var titleText: UITextView!
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        createTitleText()
    }

    func createTitleText() {
        titleText = UITextView()
        // 角を丸める
        titleText.layer.cornerRadius = 1.5
        // 枠線の太さと色を決定
        titleText.layer.borderWidth = 0.1
        titleText.layer.borderColor = UIColor.gray.cgColor
        titleText.clearsOnInsertion = true

        self.view.addSubview(titleText)
        // AutoLayout をオフにして、constraints を効くようにする
        titleText.translatesAutoresizingMaskIntoConstraints = false

        view.addConstraints([
            // NavigationBar の下 60px に配置
            NSLayoutConstraint(item: titleText,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.topLayoutGuide,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 60),

            // 高さを 30px に固定
            NSLayoutConstraint(item: titleText,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 30),
            // 幅を 300px に固定
            NSLayoutConstraint(item: titleText,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .width,
                               multiplier: 1.0,
                               constant: 300),
            // センターに配置
            NSLayoutConstraint(item: titleText,
                               attribute: .centerX,
                               relatedBy: .equal,
                               toItem: view,
                               attribute: .centerX,
                               multiplier: 1.0,
                               constant: 0)
            ]
        )
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
