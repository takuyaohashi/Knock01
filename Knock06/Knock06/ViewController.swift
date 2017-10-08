//
//  ViewController.swift
//  Knock06
//
//  Created by Takuya OHASHI on 2017/10/04.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var signupButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        passwordText.isSecureTextEntry = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

