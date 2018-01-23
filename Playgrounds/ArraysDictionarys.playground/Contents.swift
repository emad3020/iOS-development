//: Playground - noun: a place where people can play

import UIKit

// this play ground for testing and training on arrays
// and dictionaries


// creating array of dictionary


var Array : [[String : String]] = [
    ["Programmer" : "Emad","Designer":"Mohand","Writer":"Ahmed"],
    ["Tester":"Khaled","Database":"SQL Server","Language":"Java"]
]

print(Array[0]["Programmer"]!)
print(Array[1]["Tester"]!)


// creating dictionary of arrays

var dictionary : [String : [String]] = [
    "Names" :["Ahmed", "Ali" , "Khaled","Hani"],
    "Jobs":["Programmer","Writer","officer","Designer"]
]

print(dictionary["Names"]![1])






