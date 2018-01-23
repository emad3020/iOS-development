//
//  CurrentWeather.swift
//  rainyShainySunShine
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

import Alamofire

class CurrentWeather {
    
    var _cityName : String!
    var _date : String!
    var _weatherType : String!
    var _currentTemp : Double!
   
    var cityName : String {
        if _cityName == nil {
            _cityName = ""
        }
        return _cityName
    }
    
    var date : String {
        if _date == nil {
            _date = ""
        }
         let dateFormater = DateFormatter()
        dateFormater.dateStyle = .long
        dateFormater.timeStyle = .none
        let currentDate = dateFormater.string(from: Date())
        self._date = "Today, \(currentDate)"
        
        return _date
    }
    
    
    var weatherType : String {
        if _weatherType == nil {
            _weatherType = ""
        }
        return _weatherType
    }
    
    
    var currentTemp :Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    func dolwnloadWeatherDetails(completed : DownloadComplete) {
        
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        print("@@@@ \(currentWeatherUrl)")
        Alamofire.request(currentWeatherUrl,method: .get).responseJSON { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self._cityName = name.capitalized
                    print(self._cityName)
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String{
                        self._weatherType = main.capitalized
                        print(self._weatherType)
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let temp = main["temp"] as? Double {
                        self._currentTemp = temp - 273.15
                        print(self._currentTemp)
                    }
                }
            }
        }
        completed()
        
        
    }
    
    
    
}

