//
//  WeatherAPILocation.swift
//  
//
//  Created by Dmitry Seliverstov on 01.10.2021.
//

import Foundation

extension WeatherAPI {
    
    public struct Location : Codable {
        
        public let name: String
        public let region: String
        public let country: String
        public let lat: Double
        public let lon: Double
        public let tz_id: String
        public let localtime_epoch: Int
        public let localtime: String
    }
}
