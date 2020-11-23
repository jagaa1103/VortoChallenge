//
//  ContentView.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var locationManager = LocationManager()
    
    var body: some View {
        SearchView(coordinate: Coordinate(lat: 37.33021261, lon: -122.02671669))
//        TabView {
//            SearchView(coordinate: Coordinate(lat: 37.33021261, lon: -122.02671669)).tabItem {
//                Image(systemName: "list.dash")
//                Text("Search")
//            }
//            MapView(coordinate: locationManager.lastUpdatedLocation ?? Coordinate(lat: 37.33021261, lon: -122.02671669)).tabItem {
//                Image(systemName: "location")
//                Text("Search")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
