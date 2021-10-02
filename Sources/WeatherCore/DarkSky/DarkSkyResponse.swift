//
//  DarkSkyResponse.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import UIKit

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

extension DarkSky {
    
    static let dateFormatter = DateFormatter()
    
    public enum Icon : String {
        case clear_day = "clear-day"
        case clear_night = "clear-night"
        case cloudy = "cloudy"
        case partly_cloudy_day = "partly-cloudy-day"
        case partly_cloudy_night = "partly-cloudy-night"
        case rain = "rain"
        
        public var image: UIImage {
            var img: UIImage?
            switch self {
            case .clear_day:
                img = UIImage(systemName: "sun.min")
            case .clear_night:
                img = UIImage(systemName: "moon")
            case .cloudy:
                img = UIImage(systemName: "smoke")
            case .partly_cloudy_day:
                img = UIImage(systemName: "cloud.sun")
            case .partly_cloudy_night:
                img = UIImage(systemName: "cloud.moon")
            case .rain:
                img = UIImage(systemName: "cloud.rain")
            }
            return img ?? UIImage()
        }
    }
}
