//
//  Category.swift
//  coder-swag
//
//  Created by Emad on 1/18/18.
//  Copyright © 2018 Askerlap. All rights reserved.
//

import Foundation

struct Category {
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title:String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
