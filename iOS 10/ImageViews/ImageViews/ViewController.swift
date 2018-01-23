//
//  ViewController.swift
//  ImageViews
//
//  Created by Emad on 6/10/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var cuteDogImageView: UIImageView!
    @IBOutlet weak var cuteCatImageView: UIImageView!
    
    
    @IBOutlet weak var hideCutenessButton: UIButton!
    
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideCutenessButton.hidden = true
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

  @IBAction func hideCutenessPressed(sender: UIButton) {
    
    if !cuteDogImageView.hidden || !cuteCatImageView.hidden {
        cuteCatImageView.hidden = true
        cuteDogImageView.hidden = true
        hideCutenessButton.hidden = true
    }
        
        
    }
    @IBAction func showCuteness(sender: UIButton) {
        
        if cuteCatImageView.hidden || cuteDogImageView.hidden {
            
            cuteDogImageView.hidden = false
            cuteCatImageView.hidden = false
            
            cuteCatImageView.image = UIImage(named: "cute_cat")
            cuteDogImageView.image = UIImage(named: "cute_dog")
            hideCutenessButton.hidden = false
        }
        
    }
}

