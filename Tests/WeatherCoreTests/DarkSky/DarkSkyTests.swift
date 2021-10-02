import XCTest
@testable import WeatherCore
import CoreLocation

final class DarkSkyTests: XCTestCase {
    
    var expectCurrent: XCTestExpectation?
    
    func testAPIForecastPeterburg() throws {
        expectCurrent = expectation(description: "DarkSkyTests_testAPIForecastPeterburg")
        let location = CLLocation(latitude: 59.950015, longitude: 30.316599)
        DarkSky.Request.requestWithLocation(location) { result in
            switch result {
            case .failure(let error):
                XCTFail("\nERROR_DarkSkyTests_testAPIForecastPeterburg\(error)")
            case .success(let response):
                print("\nDarkSkyTests_testAPIForecastPeterburg \(response)")
                self.expectCurrent?.fulfill()
            }
        }
        waitForExpectations(timeout: 10) { error in }
    }
    
    func testAPIForecast() throws {
        expectCurrent = expectation(description: "DarkSkyTests_testAPIForecast")
        guard let urlString = "https://api.darksky.net/forecast/\(DarkSky_Key)/55.753913,37.620836"
                .addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed)
        else {
            fatalError()
        }
        print("DarkSkyTests_testAPIForecast_urlString \(urlString)")
        guard let url = URL(string: urlString) else {
            fatalError()
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { responseData, response, error in
            guard error == nil else {
                let err = "\nERROR_DarkSkyTests_testAPIForecast \(String(describing: error))"
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
                let resp = try decoder.decode(DarkSky.Response.self, from: data)
                print(resp)
                self.expectCurrent?.fulfill()
            } catch {
                XCTFail("ERROR_DarkSkyTests_testAPIForecast_response \(error)")
            }
        }.resume()
        waitForExpectations(timeout: 10) { error in }
    }
}
