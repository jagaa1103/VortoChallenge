//
//  SearchViewModel.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import Foundation
import Combine
import UIKit
import CoreLocation

class SearchViewModel: ObservableObject {
    
    @Published var restaurants = [Restaurant]()
    let locationManager = LocationManager()
    
    var currentLocation: Coordinate?
    

//    init() {
////        locationManager.delegate = self
//    }
    
    func searchRestaurants(text: String){
        let url = getURL(text: text)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue("Bearer IaQepd0smW9jCABgIQ2u9i2IWELD5zFc9n2N9AML0EOAXVJNosNLkcs-IfXstYY7MCXPWTPJh6OmbAnukzBk0nTd1WhxlvWKmSHiU909fhCsg3vs7NxiX7NhIaK4X3Yx", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            if let err = error {
                print(err.localizedDescription)
                return
            }
            guard let d = data else {
                print("No data!!!")
                return
            }
            do {
                let result = try JSONDecoder().decode(Result.self, from: d)
                DispatchQueue.main.async {
                    self.restaurants = result.businesses
                }
            } catch {
                print("Parsing Error info: \(error)")
            }
        }.resume()
    }
    
    func getURL(text: String) -> URL? {
        var urlString = "https://api.yelp.com/v3/businesses/search?term=\(text)"
        if let location = currentLocation {
            urlString += "&latitude=\(location.lat)&longitude=\(location.lon)"
        } else {
            urlString = "https://api.yelp.com/v3/businesses/search?term=delis&latitude=37.786882&longitude=-122.399972"
            print("location is not detected!")
        }
        return URL(string: urlString)
    }
}

extension SearchViewModel: LocationManagerDelegate {
    func locationChanged(coord: Coordinate) {
        self.currentLocation = coord
    }
}
