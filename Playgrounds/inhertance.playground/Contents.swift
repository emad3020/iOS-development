//: Playground - noun: a place where people can play

import UIKit



//inhertance exapmle


class shape {
    private var x : Int
    private var y : Int
    
    init(x : Int , y : Int) {
        
        self.x = x
        self.y = y
    }
    
    
    func area(long : Int , tall : Int) -> Int {
        let areaSum = long * tall ;
        
        return areaSum
    }
}


class sqare : shape {
    private var name : String
    private var isRound : Bool
    
    init(name : String , isRound : Bool) {
        self.isRound = isRound
        self.name = name
        super.init(x: 12, y: 12)
    }
    
    override func area(long: Int, tall: Int) -> Int {
        let circleArea = long * tall * 2
        return circleArea
    }
    
    func dimention( r : Float , PI : Float) -> Float {
        let sum = r * PI
        return sum
    }
}


var sqareShape = sqare(name : "Sqaure" , isRound : false)

let sum = sqareShape.area(long: 5, tall: 12)

print("area of sqare \(sum)")



