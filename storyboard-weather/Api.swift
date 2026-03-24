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
}
