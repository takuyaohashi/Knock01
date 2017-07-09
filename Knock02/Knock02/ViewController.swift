//
//  ViewController.swift
//  Knock02
//
//  Created by Takuya OHASHI on 2017/07/07.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit


class ViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ToDo List"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self, action: #selector(addItem))
    }
    
    func addItem() {
        let addItemViewController = AddItemViewController()
        // 自身を保持してる navigationController を使用する
        navigationController?.pushViewController(addItemViewController, animated: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // 行の数を返す
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("section is \(section)")
        return 0
    }

    // デフォルトの　cell を返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        return cell
    }
}
