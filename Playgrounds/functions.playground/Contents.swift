//: Playground - noun: a place where people can play

import UIKit



//functions


func printString (FirstName : String , LastName : String)
{
    let string1 = FirstName
    
    let string2 = LastName
    
    print("hello Mr\(string1) \(string2)" )
}



func sum (number1 : Int , number2 : Int){
    
    
    //function body
    
    let num1 = number1
    let num2 = number2
    
   let sum = num1 + num2
    
    print("Total sumation is \(sum)")
}
sum(number1: 5, number2: 4)

printString(FirstName: " Emad", LastName: "Ahmed")