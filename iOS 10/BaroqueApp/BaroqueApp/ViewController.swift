//
//  ViewController.swift
//  BaroqueApp
//
//  Created by Emad on 6/19/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var musicianName : String = ""
        
        if segue.identifier == "bachSeg" {
            musicianName = "Bach"
        } else if (segue.identifier == "vivaldi") {
            musicianName = "Vivaldi"
            
        } else {
            musicianName = "Handel"
        }
        (segue.destination as! SecondViewController).data = musicianName
    }

}

