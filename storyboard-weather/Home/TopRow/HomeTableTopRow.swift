//
//  HomeTableTopRow.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/17/26.
//

import UIKit

class HomeTableTopRow: UITableViewCell {

    static let id = "HomeTableTopRow"
    
    @IBOutlet private weak var img: UIImageView!
    @IBOutlet private weak var tempLabel: UILabel!
    @IBOutlet private weak var locationLabel: UILabel!
    @IBOutlet private weak var descriptionLabel: UILabel!
    @IBOutlet private weak var highLowLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configure(_ weather: CurrentWeather?) {
        guard let weather else { return }
        tempLabel.text = "\(weather.main.temp)"
        locationLabel.text = "\(weather.name)"
        
//        print("Location: \(String(describing: locationLabel.text))")
        
        descriptionLabel.text = weather.weather.first?.description
        let min = weather.main.temp_min
        let max = weather.main.temp_max
        highLowLabel.text = "H:\(max)° | L:\(min)°"
    }

}
