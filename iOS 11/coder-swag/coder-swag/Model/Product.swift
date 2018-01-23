//
//  Product.swift
//  coder-swag
//
//  Created by Emad on 1/18/18.
//  Copyright © 2018 Askerlap. All rights reserved.
//

import Foundation

struct Product{
    private(set) public var title:String
    private(set) public var price: String
    private(set) public var imageName:String
    
    init(title:String , price:String, imageName: String) {
        self.imageName = imageName
        self.price = price
        self.title = title
    }
}
