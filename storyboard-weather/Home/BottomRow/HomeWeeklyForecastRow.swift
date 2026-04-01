//
//  HomeWeeklyForecastRow.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/17/26.
//

import UIKit

class HomeWeeklyForecastRow: UITableViewCell {

    static let id = "HomeWeeklyForecastRow"
    private var dailyForecast: [DailyForecast] = []
    
    @IBOutlet private weak var weeklyTableView: UITableView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupTableView()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    private func setupTableView() {
        weeklyTableView.dataSource = self
        weeklyTableView.delegate = self
        
    }
    
    func configure(_ forecast: WeeklyForecast?) {
        guard let list = forecast?.list else {
            return
        }
        
        dailyForecast = list.getDailyForecast(list)
        weeklyTableView.reloadData()
        
    }
    
    
}

extension HomeWeeklyForecastRow: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dailyForecast.count > 5 ? 5 : dailyForecast.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // make sure to add as!
        let cell = weeklyTableView.dequeueReusableCell(withIdentifier: WeeklyForecastDetailRow.id, for: indexPath) as! WeeklyForecastDetailRow
        let forecast = dailyForecast[indexPath.row]
        cell.configure(forecast)
        return cell
    }
}

extension HomeWeeklyForecastRow: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
