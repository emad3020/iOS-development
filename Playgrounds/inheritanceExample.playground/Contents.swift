//: Playground - noun: a place where people can play


class Product {
    var name : String
    var price: Int
    
    init(Name : String , Price : Int) {
        self.name = Name
        self.price = Price
    }
}

class Book :Product {
    var Author :String
    init(Author : String,name : String , price : Int) {
        self.Author = Author
        super.init(Name: name, Price: price)
    }
    
}

let Book1 = Book(Author: "Daneil", name: "Introduction to Java Programming", price: 38)

print("\(Book1.name) for \(Book1.Author)")
