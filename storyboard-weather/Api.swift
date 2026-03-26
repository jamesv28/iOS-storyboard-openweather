//
//  Api.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/23/26.
//

import Foundation

class Api {
    
    // create a singleton
    static let shared = Api()
    
    // have to add a private init for a singleton class
    private init() {}
    
    // a completion block when executes
    func fetchCurrentWeather(completion: @escaping (CurrentWeather?) -> Void) {
        
        // below is to get data within the project
        guard let path = Bundle.main.path(forResource: "CurrentWeather", ofType: "json") else {
            completion(nil)
            return
        }
        
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            let decodeData = try decoder.decode(CurrentWeather.self, from: data)
            completion(decodeData)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    func fetchCurrentWeatherLive(completion: @escaping (CurrentWeather?) -> Void) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?lat=39.74&lon=104.99&appid=4da07b58ab36c26bd870b2de6ef6fe20&units=imperial"
        
        let url = URL(string: urlString)!
        let task = URLSession.shared.dataTask(with: url) {
            data, response, error in
            guard error == nil, let data else {
                completion(nil)
                return
            }
            let decoder = JSONDecoder()
            do {
                let decodedData = try decoder.decode(CurrentWeather.self, from: data)
                completion(decodedData)
            } catch {
                print(error)
                completion(nil)
            }
        }
        task.resume()
    }
    
    // get the f-day weather forecast
    // 5-day forecast: api.openweathermap.org/data/2.5/forecast?lat=39.74&lon=104.99&appid=4da07b58ab36c26bd870b2de6ef6fe20&units=imperial
    
    func fetchWeeklyForecast(completion: @escaping (WeeklyForecast?) -> Void) {
        guard let path = Bundle.main.path(forResource: "WeeklyForecast", ofType: "json") else {
            completion(nil)
            return
        }
        
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        
        do {
            let data = try Data(contentsOf: url)
            let decodeData = try decoder.decode(WeeklyForecast.self, from: data)
            completion(decodeData)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    func getSample<T: Decodable>(_ type: T.Type, completion: @escaping (T?) -> Void) {
        let resource = getResourceName(type)
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else {
            completion(nil)
            return
        }
        let url = URL(filePath: path)
        let decoder = JSONDecoder()
        do {
            let data = try Data(contentsOf: url)
            let decodedData = try decoder.decode(type, from: data)
            completion(decodedData)
        } catch {
            print(error)
            completion(nil)
        }
    }
    
    private func getResourceName<T>(_ type: T.Type) -> String {
        // below we are basically casting with the cases
        return switch type {
        case is CurrentWeather.Type:
            "CurrentWeather"
        case is WeeklyForecast.Type:
            "WeeklyForecast"
        default:
            ""
        }
    }
}


