//
//  ForecastDetailsController.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 30/05/2023.
//

import UIKit

class ForecastDetailsController: UITableViewController {
    
    var forecast: Forecast!
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        forecast.weather.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*let cell = tableView.dequeueReusableCell(withIdentifier: "dayForecastCell")!
        cell.textLabel?.text = forecast.weather[indexPath.row].description*/
        let cell = tableView.dequeueReusableCell(withIdentifier: "dayForecastCell") as! DayForecastCell
        cell.showForecast(forecast.weather[indexPath.row])
        return cell
    }
    
}
