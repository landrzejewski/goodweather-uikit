//
//  formatters.swift
//  GoodWeather
//
//  Created by Łukasz Andrzejewski on 30/05/2023.
//

import Foundation

func formatTemperature(value: Double) -> String {
    "\(Int(value))°"
}

func formatPressure(value: Double) -> String {
    "\(Int(value))hPa"
}

func formatDate(date: Date, dateFormat: String = "EEEE") -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = dateFormat
    return formatter.string(from: date)
}
