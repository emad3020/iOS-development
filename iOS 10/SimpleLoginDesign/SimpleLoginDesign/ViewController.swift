//
//  ViewController.swift
//  SimpleLoginDesign
//
//  Created by Emad on 6/10/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var PasswordField: UITextField!
    
    @IBOutlet weak var showmeg: UILabel!
    @IBAction func loginBtn(sender: UIButton) {
        if emailField.text?.characters.count == 0 {
            showmeg.text = "You must Enter Your email"
        } else if PasswordField.text?.characters.count == 0 {
            showmeg.text = "You must Enter Your password"

        } else {
            
            showmeg.text = ""

        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

