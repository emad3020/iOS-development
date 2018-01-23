//
//  ViewController.swift
//  RandomBook
//
//  Created by Emad on 6/9/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var ResultLabel: UILabel!
    //create an array of book names 
    
    var bookList = ["Introduction to Java" , "Programming with Swift" ,
                    "Harry potter", "Android Cookbook for professinals" ,
                    "The Brain" , " Moby deck"]

    @IBAction func showRandomBook(sender: AnyObject) {
        
        //generate a random number for array index
        
        let myRand = Int(arc4random_uniform(UInt32(bookList.count)))
        
        ResultLabel.text = bookList[myRand]
        
        //changing the color of the label randmally 
        
        ResultLabel.textColor = UIColor(red: CGFloat(drand48()), green: CGFloat(drand48()), blue: CGFloat(drand48()), alpha: 1)
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }

  


}

