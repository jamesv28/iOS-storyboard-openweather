import UIKit

class HomeVC: UIViewController {

    private var currentWweather: CurrentWeather?
    private var weeklyForecast: WeeklyForecast?
    @IBOutlet private weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTable()
        
        Api.shared.fetchCurrentWeatherLive { weather in
            guard let weather else { return }
            print("We receive data here")
            
            // dispatch queue puts the below code on the main thread
            // update table view here
            
            // weak tells to deallocate its reference as soon as appropriate
            DispatchQueue.main.async { [weak self] in
                self?.currentWweather = weather
                self?.tableView.reloadData()
            }
            
        }
        
        
        Api.shared.getSample(WeeklyForecast.self) { forecast in
            guard let forecast else {return }
            DispatchQueue.main.async { [weak self] in
                guard let self else {return}
                self.weeklyForecast = forecast
                self.tableView.reloadData()
            }
//            dump("forecast \(forecast)")
        }
        
    }

    private func setUpTable() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    
    @IBAction func didTapListButton(_ sender: UIBarButtonItem) {
        let vc = SearchVC()
        navigationController?.pushViewController(vc, animated: true)
    }
    
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
            cell.configure(weeklyForecast)
            return cell
        case 2:
            let cell = tableView.dequeueReusableCell(withIdentifier: HomeWeeklyForecastRow.id, for: indexPath) as! HomeWeeklyForecastRow
            cell.configure(weeklyForecast)
            return cell
        default:
            return UITableViewCell()
        }
        
    }
    
    
}
