//
//  DarkSkyCurrently.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import Foundation

extension DarkSky {
    
    public struct Currently : Codable {
        
        public let time: Int
        public let summary: String
        public let icon: String
        public let precipIntensity: Double
        public let precipProbability: Double
        public let temperature: Double
        public let apparentTemperature: Double
        public let dewPoint: Double
        public let humidity: Double
        public let pressure: Double
        public let windSpeed: Double
        public let windGust: Double
        public let windBearing: Double
        public let cloudCover: Double
        public let uvIndex: Double
        public let visibility: Double
        public let ozone: Double
        
    }
}

extension DarkSky.Currently {
    
    public var dateString: String {
        let date = Date(timeIntervalSince1970: Double(time))
        return String(describing: date)
    }
    
    public var celsiusCurrentTemp: Double {
        return WeatherCore.calculateCelsius(fahrenheit: temperature)
    }
    
    public var celsiusCurrentTempString: String {
        return String(Int(celsiusCurrentTemp)) + "º C"
    }
}
