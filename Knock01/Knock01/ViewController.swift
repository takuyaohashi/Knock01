//
//  ViewController.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/05/07.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import RealmSwift
import Dispatch

class ViewController: UIViewController {
    var notificationToken: NotificationToken!
    var realm: Realm!
    var items = List<Item>()
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    
    @IBOutlet weak var tableView: UITableView!
    var todolist = RealmHelper.objects(type: Item.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ToDo List"
        
        self.navigationItem.leftBarButtonItem = editButtonItem
        
        DispatchQueue.main.async {
            self.realm = try! Realm()

            // リストを保持するためのオブジェクトを追加しておく
            if self.realm.objects(ItemList.self).first == nil {
                let list = ItemList()
                try! self.realm.write {
                    self.realm.add(list)
                }
            }
            if self.items.realm == nil, let list = self.realm.objects(ItemList.self).first {
                self.items = list.items
            }
            
            // Show initial tasks
            func updateList() {
                self.tableView.reloadData()
            }
            updateList()

            // Notify us when Realm changes
            self.notificationToken = self.realm.addNotificationBlock { _ in
                updateList()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if let item = self.delegate.item {
            try! self.realm.write {
                self.items.append(item)
            }
            self.delegate.item = nil
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func setEditing(_ editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        tableView.isEditing = editing
    }
    
    deinit {
        self.notificationToken.stop()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        let item = items[indexPath.row]
        cell.textLabel?.text = item.title
        cell.textLabel?.alpha = item.done ? 0.5 : 1
        return cell
    }

    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteButton = UITableViewRowAction(style: .normal, title: "Delete") { (action, index) -> Void in
            try! self.realm.write {
                let item = self.items[indexPath.row]
                self.realm.delete(item)
            }
        }
        deleteButton.backgroundColor = UIColor.red
        
        let doneButton = UITableViewRowAction(style: .normal, title: "Done") { (action, index) -> Void in
            let item = self.items[indexPath.row]
            try! self.realm?.write {
                item.done = !item.done
                let destinationIndexPath: IndexPath
                if item.done {
                    // move cell to bottom
                    destinationIndexPath = IndexPath(row: self.items.count - 1, section: 0)
                } else {
                    // move cell just above the first completed item
                    let completedCount = self.items.filter("done = true").count
                    destinationIndexPath = IndexPath(row: self.items.count - completedCount - 1, section: 0)
                }
                self.items.move(from: indexPath.row, to: destinationIndexPath.row)
            }
        }
        doneButton.backgroundColor = UIColor.blue
        return [deleteButton, doneButton]
    }

    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        try! realm.write {
            items.move(from: sourceIndexPath.row, to: destinationIndexPath.row)
        }
    }
}
