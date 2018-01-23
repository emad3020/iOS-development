//
//  weatherCell.swift
//  rainyShainySunShine
//
//  Created by Emad on 11/22/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class weatherCell: UITableViewCell {

    @IBOutlet weak var weatherIcon: UIImageView!
    
    @IBOutlet weak var dayLabel: UILabel!
    @IBOutlet weak var weatherType: UILabel!
    @IBOutlet weak var highTemp: UILabel!
    @IBOutlet weak var minTemp: UILabel!
    
    
    func configureCell(forecast: Forecast){
        minTemp.text = forecast.lowTemp
        highTemp.text = forecast.highTemp
        weatherType.text = forecast.weatherType
        weatherIcon.image = UIImage(named: forecast.weatherType)
        dayLabel.text = forecast.date
        
    }


}
