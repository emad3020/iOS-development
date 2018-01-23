//
//  ViewController.swift
//  RetroCalculator
//
//  Created by Emad on 8/15/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    @IBOutlet weak var display_result: UILabel!
    var btnSound : AVAudioPlayer!
    
    enum Operation :String {
        case Division = "/"
        case Multiply = "*"
        case Subtraction = "-"
        case Add = "+"
        case Empty = "Empty"
    }
    
    var currentOperation = Operation.Empty
    var runningNumber = ""
    var leftSideStr = ""
    var rightSideStr = ""
    var resultStr = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let path = Bundle.main.path(forResource: "btn", ofType: "mp3")
        
        let soundURL = URL(fileURLWithPath: path!)
        
        do {
            try btnSound = AVAudioPlayer(contentsOf: soundURL)
            btnSound.prepareToPlay()
            
        } catch let error as NSError {
            print("catch error while playing sound \(error.debugDescription)")
        }
        
        display_result.text = "0"
        
    }
    
    @IBAction func onDividePressed(sender: AnyObject){
        processOperation(operation: Operation.Division)
    }

    @IBAction func onMultiplyPressed(sender: AnyObject){
        
        processOperation(operation: Operation.Multiply)
        
    }
    @IBAction func onSubtractPressed(sender: AnyObject){
        processOperation(operation: Operation.Subtraction)
        
    }
    @IBAction func onAddPressed(sender: AnyObject){
        
        processOperation(operation: Operation.Add)
        
    }
    
    @IBAction func onEqualPressed(Sender: AnyObject){
        processOperation(operation: currentOperation)
    }
    @IBAction func numberPressed(sender : UIButton){
        playSound()
        
        runningNumber += "\(sender.tag)"
        
        display_result.text = runningNumber
        
    }

    func playSound(){
        
        if btnSound.isPlaying{
            btnSound.stop()
        }
        btnSound.play()
    }

    func processOperation(operation: Operation) {
        
        playSound()
        if currentOperation != Operation.Empty {
            
            if runningNumber != "" {
                rightSideStr = runningNumber
                
                runningNumber = ""
                
                if currentOperation == Operation.Multiply {
                    resultStr = "\(Double(leftSideStr)! * Double(rightSideStr)!)"
                    
                } else if currentOperation == Operation.Division {
                    
                    resultStr = "\(Double(leftSideStr)! / Double(rightSideStr)!)"
                    
                } else if currentOperation == Operation.Add {
                    
                    resultStr = "\(Double(leftSideStr)! + Double(rightSideStr)!)"
                    
                } else if currentOperation == Operation.Subtraction {
                    
                    resultStr = "\(Double(leftSideStr)! - Double(rightSideStr)!)"
                    
                }
                
                leftSideStr = resultStr
                
                display_result.text = resultStr
                
            }
            currentOperation = operation
        } else {
            //this is the first time an operator has been pressed
            leftSideStr = runningNumber
            
            runningNumber = ""
            currentOperation = operation
        }
    }

}

