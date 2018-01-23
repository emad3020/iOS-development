//
//  Wage.swift
//  window-shopper
//
//  Created by Emad on 1/14/18.
//  Copyright © 2018 Askerlap. All rights reserved.
//

import Foundation

class Wage {
    
    class func getHours(foreWage wage : Double , andPrice price : Double) -> Int{
        return Int(ceil(price / wage))
        
    }
    
}
