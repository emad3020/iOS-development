//
//  ViewController.swift
//  Color Maker Slider
//
//  Created by Emad on 7/14/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var greenControl: UISlider!
    @IBOutlet weak var redControl: UISlider!
    @IBOutlet weak var blueControl: UISlider!
    @IBOutlet weak var viewControl: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK : Actions
    @IBAction func changeComponentColor(_ sender: Any) {
        let r: CGFloat = CGFloat(self.redControl.value)
        let g: CGFloat = CGFloat(self.greenControl.value)
        let b: CGFloat = CGFloat(self.blueControl.value)
        
        viewControl.backgroundColor = UIColor(red: r, green: g, blue: b, alpha: 1)
    }

}

