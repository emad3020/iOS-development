//
//  ViewController.swift
//  Click Counter
//
//  Created by Emad on 6/30/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var count = 0
    @IBOutlet var label :UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
      
    }

   @IBAction func increment () {
     self.count += 1
        self.label.text = "\(self.count)"
        
    }
    
    

}

