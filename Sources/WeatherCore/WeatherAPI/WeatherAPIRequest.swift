//
//  WeatherAPIRequest.swift
//  
//
//  Created by Dmitry Seliverstov on 01.10.2021.
//

import Foundation
import CoreLocation

public struct WeatherAPI {
        
    public struct Request : Codable {
        
        public static func requestWithLocation(
            _ location: CLLocation,
            requestCompleted: @escaping (Result<WeatherAPI.Response, Error>) -> ())
        {
            let lat = String(location.coordinate.latitude)
            let lon = String(location.coordinate.longitude)
            
            let string = "https://api.weatherapi.com/v1/forecast.json?key=\(WeatherAPI_Key)&q=\(lat),\(lon)&days=7&aqi=no&alerts=no"
            
            guard let urlString = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
                  let url = URL(string: urlString)
            else {
                requestCompleted(.failure(WeatherError.any("WeatherAPI_error_urlString \(string)")))
                return
            }
            print("WeatherAPI_request_url \(url)")
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { responseData, response, error in
                guard error == nil else {
                    let err = "\nWeatherAPI_request \(String(describing: error))"
                    requestCompleted(.failure(WeatherError.any("WeatherAPI_error \(err)")))
                    return
                }
                guard let data = responseData else {
                    requestCompleted(.failure(WeatherError.any("WeatherAPI_request_nil_data \(url)")))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let weather = try decoder.decode(WeatherAPI.Response.self, from: data)
                    requestCompleted(.success(weather))
                } catch {
                    requestCompleted(.failure(WeatherError.any("WeatherAPI_response_decode_error \(error)")))
                }
            }.resume()
        }
    }
}
