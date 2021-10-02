import XCTest
@testable import WeatherCore
import CoreLocation

final class WeatherAPITests: XCTestCase {
    
    var expectCurrent: XCTestExpectation?
    
    func testAPIForecastPeterburg() throws {
        expectCurrent = expectation(description: "WeatherAPITests_testAPIForecast")
        let location = CLLocation(latitude: 59.950015, longitude: 30.316599)
        WeatherAPI.Request.requestWithLocation(location) { result in
            switch result {
            case .failure(let error):
                XCTFail("\(error)")
            case .success(let response):
                print("\nWeatherAPITests_testAPIForecastPeterburg \(response)")
                self.expectCurrent?.fulfill()
            }
        }
        waitForExpectations(timeout: 10) { error in }
    }
    
    func testAPIForecast() throws {
        expectCurrent = expectation(description: "WeatherAPITests_testAPIForecast")
        guard let urlString = "https://api.weatherapi.com/v1/forecast.json?key=\(WeatherAPI_Key)&q=59.950015, 30.316599&days=7&aqi=no&alerts=no".addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        else {
            fatalError()
        }
        print("WeatherAPITests_testAPIForecast_urlString \(urlString)")
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            guard error == nil else {
                let err = "\nERROR_WeatherAPITests_testAPIForecast_request \(String(describing: error))"
                XCTFail(err)
                return
            }
            guard let httpResponse = response as? HTTPURLResponse else {
                return
            }
            let headers = httpResponse.allHeaderFields
            print(headers)
            guard let data = responseData else {
                return
            }
            print(data)
            let decoder = JSONDecoder()
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    if let locationDict = json["location"] as? [String: Any] {
                        do {
                            let locationData = try JSONSerialization.data(withJSONObject: locationDict, options: [])
                            let location = try decoder.decode(WeatherAPI.Location.self, from: locationData)
                            print("\nWeatherAPITests_testAPIForecast_location \(location)")
                        } catch {
                            let err = "\nERROR_WeatherAPITests_testAPIForecast_location \(error)"
                            XCTFail(err)
                        }
                    }
                    if let currentDict = json["current"] as? [String: Any] {
                        do {
                            let currentData = try JSONSerialization.data(withJSONObject: currentDict, options: [])
                            let current = try decoder.decode(WeatherAPI.Current.self, from: currentData)
                            print("\nWeatherAPITests_testAPIForecast_current \(current)")
                        } catch {
                            let err = "\nERROR_WeatherAPITests_testAPIForecast_current \(error)"
                            XCTFail(err)
                        }
                    }
                    if let forecastDict = json["forecast"] as? [String: Any] {
                        if let forecastdayArray = forecastDict["forecastday"] as? [[String: Any]] {
                            forecastdayArray.enumerated().forEach { index, dayDict in
                                do {
                                    let dayData = try JSONSerialization.data(withJSONObject: dayDict, options: [])
                                    let forecastDay = try decoder.decode(WeatherAPI.ForecastDay.self, from: dayData)
                                    print("\nWeatherAPITests_testAPIForecast_forecastDay \(index) \(forecastDay)")
                                } catch {
                                    let err = "\nERROR_WeatherAPITests_testAPIForecast_forecastDay \(index) \(error)"
                                    XCTFail(err)
                                }
                            }
                        }
                    } else {
                        fatalError()
                    }
                    do {
                        let resp = try decoder.decode(WeatherAPI.Response.self, from: data)
                        print(resp)
                        self.expectCurrent?.fulfill()
                    } catch {
                        XCTFail("ERROR_WeatherAPITests_testAPIForecast_response \(error)")
                    }
                }
            } catch {
                print(error)
                XCTFail("\(error)")
            }
        }.resume()
        waitForExpectations(timeout: 10) { error in }
    }
}
