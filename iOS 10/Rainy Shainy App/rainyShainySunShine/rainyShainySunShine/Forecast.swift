 //
//  Forecast.swift
//  rainyShainySunShine
//
//  Created by Emad on 11/22/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
 import Alamofire
 
 class Forecast {
    
    var _date : String!
    var _weatherType : String!
    var _highTemp : String!
    var _lowTemp : String!
    
    var date: String {
        if _date == nil {
            _date = ""
        }
        return _date
    }
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    var highTemp : String {
        if _highTemp == nil {
            _highTemp = ""
        }
        return _highTemp
    }
    
    var lowTemp : String {
        if _lowTemp == nil {
            _lowTemp = ""
        }
        return _lowTemp
    }
    
    init(weatherDict: Dictionary<String, AnyObject> ) {
        if let main = weatherDict["temp"] as? Dictionary<String,AnyObject> {
            if let temp_min = main["min"] as? Double {
                self._lowTemp = "\(Int(temp_min - 273.15))"
            }
            if let temp_max = main["max"] as? Double {
                self._highTemp = "\(Int(temp_max - 273.15))"
            }
        }
        if let weather = weatherDict["weather"] as? [Dictionary< String, AnyObject>] {
            if let main = weather[0]["main"] as? String {
                self._weatherType = main
            }
        }
        if let date = weatherDict["dt"] as? Double  {
            print("Date from 1970 -@-@-@-@ \(date)")
            let unixConvertedDate = Date(timeIntervalSince1970: date)
            print("Date from 1970 -@-@-@-@ \(unixConvertedDate)")
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .full
            dateFormatter.dateFormat = "EEEE"
            dateFormatter.timeStyle = .none
            self._date = unixConvertedDate.dayOfTheWeak()
        }
    }
    
 }
 
 extension Date {
    func dayOfTheWeak () -> String{
        let dateFormater = DateFormatter()
        dateFormater.dateFormat = "EEEE"
        return dateFormater.string(from: self)
    }
 }
