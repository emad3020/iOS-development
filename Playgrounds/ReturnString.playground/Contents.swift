//: Playground - noun: a place where people can play

import UIKit


//string return type



func showColor (colorName : String , colorNum : Int) -> String {
    
    if colorNum == 4 {
        
        return "\(colorName) is not related to the number you passed in !"
    } else {
     
        return "\(colorName) is indeed related to the number you passed in !"

    }
    
}


showColor(colorName: "red", colorNum: 4)