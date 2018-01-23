//
//  ViewController.swift
//  shareDataWithSegue
//
//  Created by Emad on 8/13/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstNum: UITextField!
    @IBOutlet weak var secondNum: UITextField!
    var sumResult:Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func calculateBtnPressed(_ sender: Any) {
        let num1  = Int(firstNum.text!)!
        let num2 = Int(secondNum.text!)!
        sumResult = num1 + num2
        
        
        performSegue(withIdentifier: "sum_segue", sender: sumResult)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if let destination = segue.destination as? ResultVC {
            
            if let sum = sender as? Int{
                destination.result = sum
            }
            
        }
    }

}

