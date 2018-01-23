//
//  ResultViewController.swift
//  Roshambo Game
//
//  Created by Emad on 7/15/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    //MARK: Properties
    @IBOutlet weak var result_label: UILabel!
    @IBOutlet weak var ImageViewController: UIImageView!
    
    enum Shape : String {
        case rock = "Rock"
        case paper = "Paper"
        case scissors = "Scissors"
        
        //genrate a random shape string 
        static func genrateRadom() -> Shape {
            let shapes = ["Rock" , "Paper" , "Scissors"]
            let randomShape = Int(arc4random_uniform(3))
            
            return Shape(rawValue: shapes[randomShape])!
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

  
    @IBAction func onDissmisClicked(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }

}
