//: Playground - noun: a place where people can play

import UIKit


//function with bool return 


func checkPasswordLenght (passwordString : String) -> Bool {
    if passwordString.characters.count  < 3 {
        
        return false
    } else {
    return true
    }
}


checkPasswordLenght(passwordString: "password123")

checkPasswordLenght(passwordString: "pp")


if checkPasswordLenght(passwordString: "emad") {
    
    print("your password is valid")
} else {
    
    print("your password is not valid")
}