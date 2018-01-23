//
//  ViewController.swift
//  switchUIElement
//
//  Created by Emad on 6/9/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mySwitch: UISwitch!
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBAction func switchChanged(sender: UISwitch) {
        
//         resultLabel.text = mySwitch.on.description
    }
    @IBAction func btnLogin(sender: UIButton) {
        if !mySwitch.on {
            resultLabel.text = "You must accept the terms first"
        } else {
            resultLabel.text = "Login Successfully"
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

