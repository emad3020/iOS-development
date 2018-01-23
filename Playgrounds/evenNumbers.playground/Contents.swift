//: Playground - noun: a place where people can play

import UIKit



//for loop to print the even number from 0 to 10
for index in 0  ..< 10  {
    
    if index % 2 == 0 {
        print(index)
    }
}


//for loop to prin the sum of numbers from 0 to 50

var sum = 0
for i in 0 ..< 50 {
    sum += i
}

print(sum)


//while loop to get the odd numbers between 0 till 100

var j = 0
while j < 100
{
    if j % 2 == 1 {
        print("odd number is \(j)")
    }
    j+=1
}



//do-while is called in swift as repeat 

var  a  = 0

repeat {
    print(a)
    a+=1
    
} while ( a <= 10)