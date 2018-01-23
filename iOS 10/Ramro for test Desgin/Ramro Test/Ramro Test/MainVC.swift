//
//  ViewController.swift
//  Ramro Test
//
//  Created by Emad on 8/23/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class MainVC: UIViewController {

    @IBOutlet weak var btn_facebook: UIButton!
    
    @IBOutlet weak var btn_google: UIButton!
    @IBOutlet weak var btn_login: UIButton!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        

        btn_facebook.layer.cornerRadius = 16
        btn_google.layer.cornerRadius = 16
        btn_login.layer.cornerRadius = 16
    
        
    }

   


}

