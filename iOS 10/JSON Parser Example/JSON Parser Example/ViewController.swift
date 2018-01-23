//
//  ViewController.swift
//  JSON Parser Example
//
//  Created by Emad on 10/14/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    var single_place = singlePlace()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        single_place.getPlaceData {
            //handele any thing here
        }
    }



}

