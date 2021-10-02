//
//  WeatherAPIForecast.swift
//  
//
//  Created by Dmitry Seliverstov on 01.10.2021.
//

import Foundation

extension WeatherAPI {
    
    public struct Forecast : Codable {
        public let forecastday: [WeatherAPI.ForecastDay]
    }
}

extension WeatherAPI {
    
    public struct ForecastDay : Codable {
        
        public let date: String
        public let date_epoch: Int
        public let day: WeatherAPI.Day
        public let astro: WeatherAPI.Astro
        public let hour: [WeatherAPI.Hour]
        
    }
}

extension WeatherAPI {
    
    public struct Day : Codable {
        
        public let maxtemp_c: Double
        public let maxtemp_f: Double
        public let mintemp_c: Double
        public let mintemp_f: Double
        public let avgtemp_c: Double
        public let avgtemp_f: Double
        public let maxwind_mph: Double
        public let maxwind_kph: Double
        public let totalprecip_mm: Double
        public let totalprecip_in: Double
        public let avgvis_km: Double
        public let avgvis_miles: Double
        public let avghumidity: Double
        public let daily_will_it_rain: Double
        public let daily_chance_of_rain: Double
        public let daily_will_it_snow: Double
        public let daily_chance_of_snow: Double
        public let condition: WeatherAPI.Condition
        public let uv: Double
        
    }
}
    
extension WeatherAPI {
    
    public struct Astro : Codable {
    
        public let sunrise: String
        public let sunset: String
        public let moonrise: String
        public let moonset: String
        public let moon_phase: String
        public let moon_illumination: String
        
    }
}

extension WeatherAPI {
    
    public struct Hour : Codable {
        
        public let time_epoch: Int
        public let time: String
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
        public let windchill_c: Double
        public let windchill_f: Double
        public let heatindex_c: Double
        public let heatindex_f: Double
        public let dewpoint_c: Double
        public let dewpoint_f: Double
        public let will_it_rain: Double
        public let chance_of_rain: Double
        public let will_it_snow: Double
        public let chance_of_snow: Double
        public let vis_km: Double
        public let vis_miles: Double
        public let gust_mph: Double
        public let gust_kph: Double
        public let uv: Double
        
    }
}
