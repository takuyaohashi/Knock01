//
//  ViewController.swift
//  Knock05
//
//  Created by Takuya OHASHI on 2017/09/19.
//  Copyright © 2017年 Takuya OHASHI. All rights reserved.
//

import UIKit
import Firebase

class ViewController: UIViewController {
    @IBOutlet var emailText: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func submitEmail(sender:UIButton) {
        guard let email = emailText.text, !email.isEmpty else {
            return
        }
        Auth.auth().fetchProviders(forEmail: email) { text, error in
            if let validError = error {
                print("\(validError.localizedDescription)")
            } else {
                if let validText = text, !validText.isEmpty {
                    print("email is valid")
                } else {
                    self.performSegue(withIdentifier: "registerViewController",sender: email)
                }
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "registerViewController") {
            let rvc = segue.destination as! RegisterViewController
            rvc.email = sender as! String
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

