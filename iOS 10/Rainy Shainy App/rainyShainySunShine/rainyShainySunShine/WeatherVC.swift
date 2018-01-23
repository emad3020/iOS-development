//
//  WeatherVC.swift
//  rainyShainySunShine
//
//  Created by Emad on 9/4/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import Alamofire
import CoreLocation

class WeatherVC: UIViewController, UITableViewDelegate, CLLocationManagerDelegate , UITableViewDataSource {

    //MARK:outlets
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var currentTempLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var currentWeatherTypeLabel: UILabel!
    @IBOutlet weak var currentWeatherImage: UIImageView!
    @IBOutlet weak var tabelView: UITableView!
    
    //MARK: variables and constants
    let locationManager = CLLocationManager()
    var currentLocation: CLLocation!
    var currentWeather : CurrentWeather!
    var forecast : Forecast!
    var forecasts = [Forecast]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
        
        tabelView.delegate = self
        tabelView.dataSource = self
        currentWeather = CurrentWeather()
        
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        locationAuthStatus()
    }
    func locationAuthStatus(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude
            self.downloadForecastData {
                self.dolwnloadWeatherDetails()
            }
        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthStatus()
        }
    }
    func downloadForecastData(completed: DownloadComplete) {
        //downloding forecast data for tableView
        
        let forecastURL = URL(string: FORECAST_URL)!
        print(forecastURL)
        Alamofire.request(forecastURL).responseJSON { response in
            let result = response.result
            if let dict = result.value as? Dictionary<String , AnyObject> {
                if let list = dict["list"] as? [Dictionary<String , AnyObject>]{
                    
                    for obj in list {
                        let forecast = Forecast(weatherDict: obj)
                        self.forecasts.append(forecast)
                        print(obj)
                    }
                    self.forecasts.remove(at: 0)
                    self.tabelView.reloadData()
                }
            }
            
        
            
        }
        completed()
        
    }
    //MARAK: TableView Functions
    func numberOfSections(in tableView: UITableView) -> Int {
    return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "weatherCell", for: indexPath) as? weatherCell {
       let currentForecast = forecasts[indexPath.row]
            cell.configureCell(forecast: currentForecast)
            return cell
        } else {
            return weatherCell()
        }
    }
    
    
    func updateMainUI() {
        dateLabel.text = currentWeather.date
        currentTempLabel.text = "\(currentWeather.currentTemp)"
        currentWeatherTypeLabel.text = currentWeather.weatherType
        locationLabel.text = currentWeather.cityName
        currentWeatherImage.image =  UIImage(named: currentWeather.weatherType)
        
    }

    func dolwnloadWeatherDetails() {
        
        let currentWeatherUrl = URL(string: CURRENT_WEATHER_URL)!
        Alamofire.request(currentWeatherUrl,method: .get).responseJSON { response in
            
            let result = response.result
            if let dict = result.value as? Dictionary<String, AnyObject> {
                if let name = dict["name"] as? String {
                    self.currentCityLabel.text = name.capitalized
                }
                if let weather = dict["weather"] as? [Dictionary<String, AnyObject>] {
                    if let main = weather[0]["main"] as? String{
                        self.currentWeatherTypeLabel.text = main.capitalized
                        self.currentWeatherImage.image = UIImage(named: main.capitalized)
                    }
                }
                if let main = dict["main"] as? Dictionary<String,AnyObject> {
                    if let temp = main["temp"] as? Double {
                        self.currentTempLabel.text = "\(temp - 273.15)"
                    }
                }
            }
        }
    }

}

