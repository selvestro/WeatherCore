//
//  DarkSkyDaily.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import Foundation

extension DarkSky {
    
    public struct Daily : Codable {
        
        public let summary: String
        public let icon: String
        public let data: [DarkSky.Daily.Data]
    }
}

extension DarkSky.Daily {
    
    public struct Data : Codable {
        
        public let time: Int
        public let summary: String
        public let icon: String
        public let sunriseTime: Int
        public let sunsetTime: Int
        public let moonPhase: Double
        public let precipIntensity: Double
        public let precipIntensityMax: Double
        public let precipProbability: Double
        public let temperatureHigh: Double
        public let temperatureHighTime: Int
        public let temperatureLow: Double
        public let temperatureLowTime: Int
        public let apparentTemperatureHigh: Double
        public let apparentTemperatureHighTime: Int
        public let apparentTemperatureLow: Double
        public let apparentTemperatureLowTime: Int
        public let dewPoint: Double
        public let humidity: Double
        public let pressure: Double
        public let windSpeed: Double
        public let windGust: Double
        public let windGustTime: Int
        public let windBearing: Double
        public let cloudCover: Double
        public let uvIndex: Double
        public let uvIndexTime: Int
        public let visibility: Double
        public let ozone: Double
        public let temperatureMin: Double
        public let temperatureMinTime: Int
        public let temperatureMax: Double
        public let temperatureMaxTime: Int
        public let apparentTemperatureMin: Double
        public let apparentTemperatureMinTime: Int
        public let apparentTemperatureMax: Double
        public let apparentTemperatureMaxTime: Int
        
    }
}
