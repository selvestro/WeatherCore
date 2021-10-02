//
//  DarkSkyResponse.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import Foundation

extension DarkSky {
    
    public struct Response : Codable {
        
        public let latitude: Double
        public let longitude: Double
        public let timezone: String
        public let currently: DarkSky.Currently
        public let hourly: DarkSky.Hourly
        public let daily: DarkSky.Daily
        public let flags: DarkSky.Flags
        public let offset: Double
    }
}
