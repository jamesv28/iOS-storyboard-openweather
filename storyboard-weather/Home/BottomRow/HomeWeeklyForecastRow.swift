//
//  HomeWeeklyForecastRow.swift
//  storyboard-weather
//
//  Created by James Volmert on 3/17/26.
//

import UIKit

class HomeWeeklyForecastRow: UITableViewCell {

    static let id = "HomeWeeklyForecastRow"
    
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
    func configure() {
        
    }

}

extension HomeWeeklyForecastRow: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = weeklyTableView.dequeueReusableCell(withIdentifier: WeeklyForecastDetailRow.id, for: indexPath)
        return cell
    }
}

extension HomeWeeklyForecastRow: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
