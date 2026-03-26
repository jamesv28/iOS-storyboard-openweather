//
//  WeeklyForecast.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/25/26.
//

import Foundation

struct WeeklyForecast: Decodable {
    let cod: String
    let message: String
    let cnt: Int
    let list: [WeeklyForecastList]?
    let city: WeeklyForecastCity?
}

struct WeeklyForecastList: Decodable {
    let dt: Int
    let main: WeeklyForecastMain
    let weather: [WeeklyForecastWeather]
    let clouds: WeeklyForecastClouds
    let wind: WeeklyForecastWind
    let Visibility: Int
    let pop: Double
    let sys: WeeklyForecastSys
    let dt_text: String
}

struct WeeklyForecastMain: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let sea_level: Int
    let grnd_level: Int
    let humidity: Int
    let temp_kf: Double
}

struct WeeklyForecastWeather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct WeeklyForecastCity: Decodable {
    let id: Int
    let name: String
    let coord: WeeklyForecastCoord
    let country: String
    let population: Int
    let timezone: String
    let sunrise: Int
    let sunset: Int
}

struct WeeklyForecastCoord: Decodable {
    let lat: Double
    let lon: Double
}

struct WeeklyForecastClouds: Decodable {
    let all: Int
}

struct WeeklyForecastWind: Decodable {
    let speed: Double
    let deg: Int
    let gust: Double?
}

struct WeeklyForecastSys: Decodable {
    let pod: String
}
