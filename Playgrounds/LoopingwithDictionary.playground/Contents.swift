//: Playground - noun: a place where people can play

import UIKit

//for loop to get the values and keys of a dictionary



//define and initialize dictionary 

var familyAges = ["Emad" : 23 , " Ahmed" : 45 , "Mohammed" : 35 , "Ali" : 29]

for (key,v) in familyAges {
    
    print("the key \(key) has the value of \(v)")
}



//define and initialize an array of integers

var myarray = [ 10,20 ,30 ,40 ,50 , 55 , 66 ,23 ,11 ,5 ,7 ,9]


//to print the all values int the array using for in loop
for arr in myarray {
 
        print(arr)
    
}


//to show the od and the even numbers in the array
for index in 0 ..< myarray.count {
    
    if myarray[index] % 2 == 1 {
        
        print("the odd in the array is \(myarray[index])")
        
    } else {
        
      print("the even in the array is \(myarray[index])")
}
}