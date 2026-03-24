import UIKit

class HomeVC: UIViewController {

    private var currentWweather: CurrentWeather?
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        Api.shared.fetchCurrentWeather { weather in
            guard let weather else { return }
            print("We receive data here")
            // update table view here
            self.currentWweather = weather
            self.tableView.reloadData()
        }
    }

    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    // api key - 4da07b58ab36c26bd870b2de6ef6fe20
    // 5-day forecast: api.openweathermap.org/data/2.5/forecast?lat=39.74&lon=104.99&appid=4da07b58ab36c26bd870b2de6ef6fe20&units=imperial

    /* current weather: https://api.openweathermap.org/data/2.5/weather?lat=39.74&lon=104.99&appid=4da07b58ab36c26bd870b2de6ef6fe20&units=imperial
     */
    
}

// this is for controlling the height of the three different table view cells
extension HomeVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return 250
        case 1:
            return 160
        case 2:
            return 330
        default:
            return 0
        }
    }
}

extension HomeVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let row = indexPath.row
        switch row {
        case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableTopRow.id, for: indexPath) as! HomeTableTopRow
            cell.configure(currentWweather)
            return cell
        case 1:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableCarousel.id, for: indexPath) as! HomeTableCarousel
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeWeeklyForecastRow.id, for: indexPath) as! HomeWeeklyForecastRow
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
