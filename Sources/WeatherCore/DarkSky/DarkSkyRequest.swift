//
//  DarkSkyRequest.swift
//  
//
//  Created by Dmitry Seliverstov on 02.10.2021.
//

import Foundation
import CoreLocation

public struct DarkSky {

    public struct Request : Codable {
        
        public static func requestWithLocation(
            _ location: CLLocation,
            requestCompleted: @escaping (Result<DarkSky.Response, Error>) -> ())
        {
            let lat = String(location.coordinate.latitude)
            let lon = String(location.coordinate.longitude)
            let string = "https://api.darksky.net/forecast/\(DarkSky_Key)/\(lat),\(lon)"
            guard let urlString = string.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed),
                  let url = URL(string: urlString)
            else {
                requestCompleted(.failure(WeatherError.any("DarkSky_error_urlString \(string)")))
                return
            }
            print("DarkSky_request_url \(url)")
            let request = URLRequest(url: url)
            URLSession.shared.dataTask(with: request) { responseData, response, error in
                guard error == nil else {
                    let err = "\nDarkSky_request \(String(describing: error))"
                    requestCompleted(.failure(WeatherError.any("DarkSky_error \(err)")))
                    return
                }
                guard let data = responseData else {
                    requestCompleted(.failure(WeatherError.any("DarkSky_request_nil_data \(url)")))
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let weather = try decoder.decode(DarkSky.Response.self, from: data)
                    requestCompleted(.success(weather))
                } catch {
                    requestCompleted(.failure(WeatherError.any("DarkSky_response_decode_error \(error)")))
                }
            }.resume()
        }
    }
}
