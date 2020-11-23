//
//  MapView.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import SwiftUI
import MapKit

struct MapView: View {
    
    var coordinate: Coordinate
    @State var selectedPlace: String = ""
    @State var showPlaceDetails: Bool = false
    var placeList = [Restaurant]()
    
    var body: some View {
        ZStack {
            MapComponent(selectedPlace: $selectedPlace, showPlaceDetails: $showPlaceDetails, currentCoordination: coordinate, annotations: makeAnnotations(places: placeList))
            
            .navigationBarTitle("Map", displayMode: .inline)
            .sheet(isPresented: $showPlaceDetails, content: { DetailView(restaurant: getSelectedRestaurant(id: selectedPlace), isPresented: $showPlaceDetails) })
        }
    }
    
    func makeAnnotations(places: [Restaurant]) -> [MKPointAnnotation] {
        return places.map { place in
            let annotation = RestaurantAnnotation()
            annotation.name = place.name
            annotation.distance = place.distance
            annotation.coordinate = CLLocationCoordinate2D(latitude: place.coordinates.latitude, longitude: place.coordinates.longitude)
            return annotation
        }
    }
    
    
    func getSelectedRestaurant(id: String) -> Restaurant {
        for i in 0..<placeList.count {
            if placeList[i].id == id {
                return placeList[i]
            }
        }
        return placeList.last!
    }
}



