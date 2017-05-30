//
//  AddItemViewController.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/05/09.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func validate() -> Bool {
        return false
    }
    
    @IBAction func addTodoItem(_ sender: Any) {
        guard validate() else {
            return;
        }
        navigationController?.popViewController(animated: true)
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
