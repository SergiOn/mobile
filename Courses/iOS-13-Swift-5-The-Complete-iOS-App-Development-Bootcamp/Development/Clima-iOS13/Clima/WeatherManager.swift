//
//  WeatherManager.swift
//  Clima
//
//  Created by Serhii Onyshchenko on 01.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "http://api.openweathermap.org/data/2.5/weather?appid=d0da1369f036fee05336c59a07bc2381&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let url = "\(weatherUrl)&q=\(cityName)"
        print(url)
    }
}
