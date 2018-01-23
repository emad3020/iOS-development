//
//  ViewController.swift
//  loopingUI
//
//  Created by Emad on 6/4/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var result: UILabel!
    @IBOutlet weak var secondNumber: UITextField!
    @IBOutlet weak var firstnumber: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 @IBAction func calculate(sender: AnyObject) {
    var num1:Int = Int(firstnumber.text!)!
    
    var sum = 0
    let num2  = Int(secondNumber.text!)!
   
    
   while num1 <= num2 {
        
        sum += num1
        num1 += 1
    }
    result.text = String(sum)
    
    }
    
}

