//
//  ViewController.swift
//  slider
//
//  Created by Emad on 6/9/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showValue: UILabel!
    @IBOutlet weak var slidr: UISlider!
    
    @IBAction func sliderValueChange(sender: UISlider) {
        
        showValue.text = String(Int(slidr.value))
        
        
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

