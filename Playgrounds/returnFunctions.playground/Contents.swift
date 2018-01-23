//: Playground - noun: a place where people can play

import UIKit

// functions with return types

//calculate the charatcer in a string

func charNumber (statmen : String) ->Int {
    
    let totalChar = statmen.characters.count
    
    return totalChar
}
//adding function 

func addNumber (firstNumber : Int , secondNumber : Int ) -> Int {
    
    let sum = firstNumber + secondNumber
    
    return sum
}

//subtraction function
func subNumber (firstNumber : Int , second : Int)  ->Int {
    
    let sub = firstNumber - second
    
    return sub
}


//multiplication function
func multNumber ( firstNumber : Int , secondNumber : Int ) -> Int {
    
    let mult = firstNumber * secondNumber
    
    return mult
}


//divition function

func divNumber ( firstNumber : Int , secondNumber : Int)  -> Int {
    
    let div = firstNumber / secondNumber
    
    return div
}

let var1 = 35 , var2 = 7

 print("the result of sumation is \(addNumber(firstNumber: var1,secondNumber: var2))")

print("the result of subtraction is \(subNumber(firstNumber: var1, second: var2))")

print("the result of multiplication is \(multNumber(firstNumber: var1, secondNumber: var2))")

print("the result of diviation is \(divNumber(firstNumber: var1, secondNumber: var2))")

print(charNumber(statmen: "hello world"))

