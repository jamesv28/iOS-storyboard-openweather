//
//  DailyCollectionCell.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/19/26.
//

import UIKit

class DailyCollectionCell: UICollectionViewCell {
   static let id = "DailyCollectionCell"
    
    @IBOutlet weak private var img: UIImageView!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak var tempLabel: UILabel!
    func configure(_ forecast: WeeklyForecastList) {
        timeLabel.text = forecast.dt_txt
        tempLabel.text = "\(forecast.main?.temp ?? 0)°"
    }
    
}
