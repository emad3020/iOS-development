//
//  Constants.swift
//  rainyShainySunShine
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import Foundation


let BASE_URL = "http://api.openweathermap.org/data/2.5/"

let LATITUDE = "lat="

let LONGITUDE = "&lon="

let APP_ID = "&appid="
let COUNT = "&cnt=7"
let APP_KEY = "42a1771a0b787bf12e734ada0cfc80cb"

//to tell download function when we will finish
typealias DownloadComplete = () -> ()


let CURRENT_WEATHER_URL = "\(BASE_URL)weather?\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(APP_ID)\(APP_KEY)"

//  api.openweathermap.org/data/2.5/forecast/daily?lat={lat}&lon={lon}&cnt={cnt}

let FORECAST_URL = "\(BASE_URL)forecast/daily?\(LATITUDE)\(Location.sharedInstance.latitude!)\(LONGITUDE)\(Location.sharedInstance.longitude!)\(COUNT)\(APP_ID)\(APP_KEY)"

