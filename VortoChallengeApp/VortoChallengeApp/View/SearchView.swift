//
//  SearchView.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import SwiftUI
import UIKit
import Combine

struct SearchView: View {
    var coordinate: Coordinate
    @State var inputText = ""
    @State var editState = false
    @State var selectedRestaurant: Restaurant?
    @State var showPlaceDetails: Bool = false
    @State var restaurants = [Restaurant]()
    
    @State var isLoading = false
    @State var isShowAlert = false
    @State var alertMessage = ""
    
    
    var body: some View {
        NavigationView{
            ZStack {
                VStack {
                    TextField("Search", text: $inputText, onEditingChanged: {editState=$0}, onCommit: {
                        DispatchQueue.global().async {
                            // Show Activity Indicator
                            isLoading = true
                            // Fetching places
                            self.fetchRestaurants(text: inputText, coordinate: coordinate)
                        }
                    })
                    .keyboardType(.webSearch)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                    VStack {
                        if isLoading {
                            ProgressView()
                        } else {
                            List(restaurants){ restaurant in
                                ListItem(restaurant: restaurant).onTapGesture {
                                    selectedRestaurant = restaurant
                                    showPlaceDetails = true
                                }
                                .listRowInsets(.init())
                            }
                        }
                    }.frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
            }
            .navigationBarTitle("Place List")
            .navigationBarItems(trailing:
                    NavigationLink(destination: MapView(coordinate: coordinate, placeList: restaurants)){
                    Text("Map")
                }
            )
            .sheet(isPresented: $showPlaceDetails, content: { DetailView(restaurant: selectedRestaurant!, isPresented: $showPlaceDetails) })
            .alert(isPresented: $isShowAlert) { Alert(title: Text("Warning"), message: Text(alertMessage), dismissButton: .default(Text("OK"))) }
        }
    }
}


extension SearchView {
    func fetchRestaurants(text: String, coordinate: Coordinate?){
        let url = getURL(text: text, coordinate: coordinate)
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        request.addValue(Constants.API_KEY, forHTTPHeaderField: Constants.API_HEADER)
        URLSession.shared.dataTask(with: request){ (data, response, error) in
            // Hide Activity Indicator
            isLoading = false
            
            if let err = error {
                print(err.localizedDescription)
                self.alertMessage = "Please check your internet connection"
                self.isShowAlert = true
                return
            }
            guard let d = data else {
                print("No data!!!")
                return
            }
            do {
                // Parsing places
                let result = try JSONDecoder().decode(Result.self, from: d)
                DispatchQueue.main.async {
                    self.restaurants = result.businesses
                    self.selectedRestaurant = self.restaurants[0]
                }
            } catch {
                self.alertMessage = "Data parsing error happened. Please try again!"
                self.isShowAlert = true
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
        return URL(string: urlString.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
    }
    
    func getSelectedRestaurant(id: String) -> Restaurant {
        for i in 0..<restaurants.count {
            if restaurants[i].id == id {
                return restaurants[i]
            }
        }
        return restaurants.last!
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView(coordinate: Coordinate(lat: 37.33021261, lon: -122.02671669))
    }
}
