//
//  NetworkService.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.22.
//

import Foundation

struct NetworkService {
    func fetchRestaurants(text: String, coordinate: Coordinate?, completion: @escaping (_ list: [Restaurant]) -> Void){
        let url = getURL(text: text, coordinate: coordinate)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue(Constants.API_KEY, forHTTPHeaderField: Constants.API_HEADER)
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
                completion(result.businesses)
            } catch {
                print("Parsing Error info: \(error)")
            }
        }.resume()
    }
    
    
    func getURL(text: String, coordinate: Coordinate?) -> URL? {
        var urlString = "https://api.yelp.com/v3/businesses/search?term=delis&latitude=37.786882&longitude=-122.399972"
        if let coord = coordinate {
            urlString = "https://api.yelp.com/v3/businesses/search?term=\(text)&latitude=\(coord.lat)&longitude=\(coord.lon)"
        } else {
            print("location is not detected!")
        }
        return URL(string: urlString)
    }
}
