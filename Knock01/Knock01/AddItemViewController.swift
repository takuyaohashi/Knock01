//
//  AddItemViewController.swift
//  Knock01
//
//  Created by Takuya OHASHI on 2017/05/09.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import RealmSwift

class AddItemViewController: UIViewController {
    
    let delegate = UIApplication.shared.delegate as! AppDelegate
    @IBOutlet weak var addButton: UIButton!

    @IBOutlet weak var titleText: UITextField! {
        didSet {
            titleText.delegate = self
            titleText.returnKeyType = .done
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        delegate.item = nil
        addButton.isEnabled = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /* 本当はもっとみたほうがいいけど、とりあえず */
    func validate() -> Bool {
        if titleText.text!.characters.count != 0 {
            return true
        } else {
            return false
        }
    }
    
    @IBAction func addTodoItem(_ sender: Any) {
        guard validate() else {
            return;
        }
        let item = Item()
        item.title = titleText.text!
        item.done = false

        /* ViewController に送るため */
        delegate.item = item
        
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

extension AddItemViewController: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true
    }
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        titleText.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        addButton.isEnabled = true
    }
    func textFieldDidBeginEditing(_ textField: UITextField) {

    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let maxLength: Int = 15
        let str = textField.text! + string
        if str.characters.count < maxLength {
            return true
        } else {
            return false;
        }
    }
}
