//
//  ViewController.swift
//  Knock02
//
//  Created by Takuya OHASHI on 2017/07/07.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UITableViewController {
    var notificationToken: NotificationToken!
    var realm: Realm!
    var items = List<TodoItem>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = "ToDo List"

        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .compose,
                                                            target: self, action: #selector(addItem))
        setupRealm()
    }
    
    func setupRealm() {
        realm = try! Realm()
        
        // 初めてアプリを起動した時
        if realm.objects(ItemList.self).first == nil {
            let list = ItemList()
            try! realm.write {
                realm.add(list)
            }
        }
        // 必ず入ってるので force unwrap する
        items = realm.objects(ItemList.self).first!.items

        func updateList() {
            self.tableView.reloadData()
        }
        updateList()

        // Realm が更新されたらリストを更新する
        notificationToken = self.realm.addNotificationBlock { _ in
            updateList()
        }
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
        return items.count
    }

    // デフォルトの　cell を返す
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.alpha = item.done ? 0.5 : 1
        return cell
    }
}
