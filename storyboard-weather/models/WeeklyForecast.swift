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
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Int?
    let sea_level: Int?
    let grnd_level: Int?
    let humidity: Int?
    let temp_kf: Int?
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


