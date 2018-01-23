//
//  ViewController.swift
//  Ferrari or Subaru
//
//  Created by Emad on 6/10/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var mainTitleLabel: UILabel!
    @IBOutlet weak var ferrariImageView: UIImageView!
    @IBOutlet weak var subaruImageView: UIImageView!
    
    @IBOutlet weak var outdoorYesNoLabel: UILabel!
    @IBOutlet weak var outdoorSwitch: UISwitch!
    
    @IBOutlet weak var fastSwitch: UISwitch!
    
    @IBOutlet weak var scaleSlider: UISlider!
    @IBOutlet weak var fastYesNoLabel: UILabel!
    @IBOutlet weak var finalResultLabel: UILabel!
    @IBOutlet weak var showResultButton: UIButton!
    
    @IBOutlet weak var scaleValueLabel: UILabel!
    //variables for points
    var outdoorResult : Int = 0
    var fastCarPoints : Int = 0
    var scalePoints : Int = 0
    var subaruPoints = 0
    var ferrariPoints = 0
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func outdoorSwitchChanged(sender: UISwitch) {
        
        if outdoorSwitch != nil {
            
            if outdoorSwitch.on {
                outdoorResult = 5 ;
                outdoorYesNoLabel.text = "Yes"
            } else {
                outdoorResult = 0
                outdoorYesNoLabel.text = " No"
            }
        }
        
        
    }
    
    @IBAction func fastSwitchChanged(sender: UISwitch) {
        
        if fastSwitch != nil {
            
            if fastSwitch.on {
                fastCarPoints = 5
                fastYesNoLabel.text = "Yes"
            } else {
                fastCarPoints = 0
                fastYesNoLabel.text = "No"
            }
        }
    }

    @IBAction func scaleSliderChanged(sender: UISlider) {
        
        if scaleSlider != nil {
            
            let scaleVal = Int(scaleSlider.value)
            let maxVal = Int(scaleSlider.maximumValue)
            scaleValueLabel.text = "\(scaleVal)/\(maxVal)"
            scalePoints = scaleVal
        }
    }
    @IBAction func showResultPressed(sender: UIButton) {
        
//        print("outdoor result is \(outdoorResult)")
        
        if outdoorSwitch != nil && fastSwitch != nil && scaleSlider != nil {
            if outdoorResult <= 0 && fastCarPoints <= 0 && ferrariPoints <= 0 {
                finalResultLabel.text = "please answer all questions"

            } else {
                
                if scalePoints <= 5 {
                    subaruPoints = outdoorResult + fastCarPoints + 4
                } else {
                    subaruPoints = outdoorResult + fastCarPoints + 0
                    ferrariPoints = outdoorResult + fastCarPoints + 4

                }
                
                if subaruPoints > ferrariPoints {
                    //you are a subaru person
                    finalResultLabel.text = "You are a subaru person"
                    mainTitleLabel.text = "Subaru"
                    ferrariImageView.hidden = true
                    subaruImageView.hidden = false

                } else {
                    //you are a ferrari person
                    finalResultLabel.text = "You are a ferrari person"
                    mainTitleLabel.text = "Ferrari"
                    ferrariImageView.hidden = false
                    subaruImageView.hidden = true

                }
            }
        }
    }

}

