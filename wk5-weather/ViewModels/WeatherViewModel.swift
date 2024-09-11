//
//  WeatherViweModel.swift
//  wk5-weather
//
//  Created by Wendy Zhou on 4/9/2024.
//
import SwiftUI
import Foundation
import MapKit

class WeatherViewModel: ObservableObject {
	
	@Published var weatherData: WeatherData?
	@State private var region: MKCoordinateRegion = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 33.8688, longitude: 151.2093), span: MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05))
	let weatherURl = "https://api.weatherapi.com/v1/forecast.json"
	let yourAPIKey = "7f0eaf94e12a4ff987f15549241109"
	
	func fetchWeather(cityName: String) {
		let urlString = "\(weatherURl)?q={city name}&appleid=\(yourAPIKey)&units=metric"
	}
	
	func performRequest(urlString: String) {
		if let url = URL(string: urlString) {
			let session = URLSession(configuration: .default)
			let task = session.dataTask(with: url) { (data, response, error) in
				if let error = error {
					print(error)
					return
				}
				if let safeData = data {
					self.parseJSON(weatherData: safeData)
				}
			}
			task.resume()
		}
	}
	
	func parseJSON(weatherData: Data) {
		let decoder = JSONDecoder()
		do {
			let decodedData = try decoder.decode(weatherData.self, from: weatherData)
			DispatchQueue.mian.async {
				self.weatherData = decodedData
			}
		}
	}
}
