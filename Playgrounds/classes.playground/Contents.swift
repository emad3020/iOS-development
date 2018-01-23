//: Playground - noun: a place where people can play

import UIKit




//class

class Ball {
    //properties
    
   private var size :Int
    
   private var color : String
    
    init(color : String , size : Int) {
        
        self.color = color
        self.size = size
    }
    
    //behaviors
    
    func bounce () -> String {
        
        return " Bouncing...."
    }
}

//create instance of the class
var myBall = Ball(color : "Green" , size : 23)

//myBall.size = 12
//myBall.color = "Blue"
//
//
//print("and I am \(myBall.bounce())")
//
//print("Here's my ball \(myBall.size) and \(myBall.color)")
