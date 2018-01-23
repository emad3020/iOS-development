//
//  ResultVC.swift
//  shareDataWithSegue
//
//  Created by Emad on 8/13/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class ResultVC: UIViewController {
    
    @IBOutlet weak var result_labl: UILabel!
    private var _result:Int!
    
    var result:Int {
        get {
            return _result
        }
        set{
            _result = newValue
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        result_labl.text = String(_result)
    }

    
}
