//
//  CurrentWeather.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/23/26.
//

import Foundation


struct CurrentWeather: Decodable {
    let coord: Coordinates
    let weather: [CurrentWeatherWeather]
    let base: String
    let main: CurrentWeatherMain
    let visibility: Int
    let wind: CurrentWeatherWind
    let clouds: CurrentWeatherClouds
    let dt: Int
    let sys: CurrentWeatherSystem
    let timezone: Int
    let id: Int
    let name: String
    let cod: Int
}

struct Coordinates: Decodable {
    let lon: Double
    let lat: Double
}

struct CurrentWeatherWeather: Decodable {
    let id: Int
    let main: String
    let description: String
    let icon: String
}

struct CurrentWeatherMain: Decodable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct CurrentWeatherWind: Decodable {
    let speed: Double
    let deg: Int
}

struct CurrentWeatherClouds: Decodable {
    let all: Int
}

struct CurrentWeatherSystem: Decodable {
//    let type: Int
//    let id: Int
    let country: String
    let sunrise: Int
    let sunset: Int
}
