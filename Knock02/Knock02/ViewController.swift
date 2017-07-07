//
//  ViewController.swift
//  Knock02
//
//  Created by Takuya OHASHI on 2017/07/07.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    private var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        // 画面いっぱいの tableView の生成
        tableView = UITableView(frame: UIScreen.main.bounds)

        self.view.addSubview(tableView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
