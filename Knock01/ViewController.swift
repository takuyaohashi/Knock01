//
//  ViewController.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/05/07.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController {

    var todolist = RealmHelper.objects(type: Item.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "ToDo List"
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        let realm = try? Realm()
        if let items = realm?.objects(Item.self).filter("done == false") {
            return items.count
        }
    
        return 0
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "myCell")
        if let todoitem = todolist?.first {
            cell.textLabel?.text = "\(todoitem.title)"
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("\(indexPath.row) is tapped")
    }
}
