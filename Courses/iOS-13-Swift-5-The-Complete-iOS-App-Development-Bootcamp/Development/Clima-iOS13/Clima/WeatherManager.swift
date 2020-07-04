//
//  WeatherManager.swift
//  Clima
//
//  Created by Serhii Onyshchenko on 01.07.2020.
//  Copyright © 2020 App Brewery. All rights reserved.
//

import Foundation

struct WeatherManager {
    let weatherUrl = "https://api.openweathermap.org/data/2.5/weather?appid=d0da1369f036fee05336c59a07bc2381&units=metric"
    
    func fetchWeather(_ cityName: String) {
        let urlString = "\(weatherUrl)&q=\(cityName)"
        print(urlString)
        
        performRequest(urlString)
    }
    
    func performRequest(_ urlString: String) {
        // 1. Create a URL
        if let url = URL(string: urlString) {
            
            // 2. Create a URLSession
            let session = URLSession(configuration: URLSessionConfiguration.default)
            
            // 3. Give the session a task
//            let task = session.dataTask(with: url, completionHandler: handle(data: response: error:))
            let task = session.dataTask(with: url) { (data, response, error) in
                if error != nil {
                    print(error!)
                    return
                }
                
                if let safeData = data {
                    let dataString = String(data: safeData, encoding: String.Encoding.utf8)
                    print(dataString!)
                    self.parseJSON(weatherData: safeData)
                    return
                }
            }
            
            // 4. Start the task
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            print(decodedData.name)
            print(decodedData.main.temp)
        } catch {
            print(error)
        }
        
    }
    
    func handle(data: Data?, response: URLResponse?, error: Error?) {
        if error != nil {
            print(error!)
            return
        }
        
        if let safeData = data {
            let dataString = String(data: safeData, encoding: String.Encoding.utf8)
            print(dataString!)
            return
        }
    }

}
