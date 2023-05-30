//
//  DayForecastCell.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 30/05/2023.
//

import UIKit

class DayForecastCell: UITableViewCell {
    
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var date: UILabel!
    
    func showForecast(_ dayForecast: DayForecast) {
       icon.image = UIImage(systemName: mapIcon(value: dayForecast.icon))
       weather.text = dayForecast.description
       temperature.text = formatTemperature(value: dayForecast.temperature)
       pressure.text = formatPressure(value: dayForecast.pressure)
       date.text = formatDate(date: dayForecast.date)
    }
    
}
