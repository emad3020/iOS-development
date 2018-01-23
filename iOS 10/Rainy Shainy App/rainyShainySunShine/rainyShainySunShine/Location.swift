//
//  Location.swift
//  rainyShainySunShine
//
//  Created by Emad on 11/23/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import CoreLocation

class Location{
    
    static var sharedInstance = Location()
    
    private init() {}
    
    var latitude: Double!
    var longitude : Double!
    
}
