//
//  DailyForecast.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/30/26.
//

import UIKit

struct DailyForecast {
    let day: String
    let description: String?
    
    var lows: [Double] = []
    var highs: [Double] = []
    var avg: Double {
        return (lows.average() + highs.average()) / 2
    }
}
