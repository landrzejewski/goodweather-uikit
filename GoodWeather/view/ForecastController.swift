//
//  ForecastController.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 29/05/2023.
//

import UIKit

class ForecastController: UIViewController {
    
    @IBOutlet weak var cityName: UITextField!
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var weather: UILabel!
    @IBOutlet weak var temperature: UILabel!
    @IBOutlet weak var pressure: UILabel!
    @IBOutlet weak var showDetailsButton: UIButton!
    
    private let forecastProvider: ForecastProvider = URLSessionForecastProvider()
    private var forecast: Forecast?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resetUI()
    }
    
    private func resetUI() {
        weather.clearText()
        temperature.clearText()
        pressure.clearText()
    }

    @IBAction func refresh(_ sender: UIButton) {
        guard let city = cityName.text else {
            return
        }
        forecastProvider.getForecast(for: city, callback: onRefreshed)
    }
    
    private func onRefreshed(result: Result<Forecast, ForecastProviderError>) {
        DispatchQueue.main.async { [self] in
            switch result {
            case .success(let forecast):
                self.forecast = forecast
                showForecast(forecast)
            case .failure(_):
                showError()
            }
        }
    }
    
    private func showForecast(_ forecast: Forecast) {
        if let currentDayForecast = forecast.weather.first {
            icon.image = UIImage(systemName: mapIcon(value: currentDayForecast.icon))
            weather.text = currentDayForecast.description
            temperature.text = formatTemperature(value: currentDayForecast.temperature)
            pressure.text = formatPressure(value: currentDayForecast.pressure)
            showDetailsButton.isEnabled = true
        }
    }
    
    private func showError() {
        icon.image = UIImage(systemName: "xmark.circle")
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showFullForecast" {
            if let controller = segue.destination as? ForecastDetailsController {
                controller.forecast = forecast
            }
        }
    }
    
}

