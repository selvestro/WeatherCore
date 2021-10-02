//
//  WeatherAPICurrent.swift
//  
//
//  Created by Dmitry Seliverstov on 01.10.2021.
//

import Foundation

extension WeatherAPI {
    
    public struct Current : Codable {
        
        public let last_updated_epoch: Int
        public let last_updated: String
        public let temp_c: Double
        public let temp_f: Double
        public let is_day: Int
        public let condition: WeatherAPI.Condition
        public let wind_mph: Double
        public let wind_kph: Double
        public let wind_degree: Double
        public let wind_dir: String
        public let pressure_mb: Double
        public let pressure_in: Double
        public let precip_mm: Double
        public let precip_in: Double
        public let humidity: Double
        public let cloud: Double
        public let feelslike_c: Double
        public let feelslike_f: Double
        public let vis_km: Double
        public let vis_miles: Double
        public let uv: Double
        public let gust_mph: Double
        public let gust_kph: Double
        
    }
}
