//
//  WeatherData.swift
//  wk5-weather
//
//  Created by Wendy Zhou on 4/9/2024.
//

import Foundation
import SwiftUI
import MapKit
import CoreLocation

struct WeatherData: Decodable {
	let name: String
	let main: Main
	let weather: [Weather]
}

struct Main: Decodable {
	let temp: Double
}

struct Weather: Decodable {
	let description: String
}
