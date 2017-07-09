//
//  AddItemViewController.swift
//  Knock02
//
//  Created by Takuya OHASHI on 2017/07/08.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    var titleField: UITextField!
    var addButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        createTitleText()
    }

    func createTitleText() {
        titleField = UITextField()
        // 角を丸める
        titleField.layer.cornerRadius = 5
        // 枠線の太さと色を決定
        titleField.layer.borderWidth = 0.1
        titleField.layer.borderColor = UIColor.gray.cgColor
        // 入力するときに以前の入力をクリアする
        titleField.clearsOnInsertion = true
        // 確定にする
        titleField.returnKeyType = .done

        titleField.textAlignment = .left
        titleField.adjustsFontSizeToFitWidth = true
        titleField.minimumFontSize = 17.0

        self.view.addSubview(titleField)
        // AutoLayout をオフにして、constraints を効くようにする
        titleField.translatesAutoresizingMaskIntoConstraints = false

        view.addConstraints([
            // NavigationBar の下 60px に配置
            NSLayoutConstraint(item: titleField,
                               attribute: .top,
                               relatedBy: .equal,
                               toItem: self.topLayoutGuide,
                               attribute: .bottom,
                               multiplier: 1.0,
                               constant: 60),

            // 高さを 30px に固定
            NSLayoutConstraint(item: titleField,
                               attribute: .height,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .height,
                               multiplier: 1.0,
                               constant: 30),
            // 幅を 300px に固定
            NSLayoutConstraint(item: titleField,
                               attribute: .width,
                               relatedBy: .equal,
                               toItem: nil,
                               attribute: .width,
                               multiplier: 1.0,
                               constant: 300),
            // センターに配置
            NSLayoutConstraint(item: titleField,
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
