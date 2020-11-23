//
//  Map.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.22.
//

import Foundation
import SwiftUI
import MapKit

struct MapComponent: UIViewRepresentable {
//    @Binding var centerCoordinate: CLLocationCoordinate2D
    @Binding var selectedPlace: String
    @Binding var showPlaceDetails: Bool
    var currentCoordination : Coordinate
    var annotations: [MKPointAnnotation]

    func makeUIView(context: Context) -> MKMapView {
        let map = MKMapView()
        map.delegate = context.coordinator
        map.showsUserLocation = true
        map.showsScale = true
        map.showsCompass = true
        map.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentCoordination.lat, longitude: currentCoordination.lon), latitudinalMeters: 500, longitudinalMeters: 500), animated: true)
        return map
    }
    
    func updateUIView(_ view: MKMapView, context: Context) {
        if annotations.count != view.annotations.count {
            view.removeAnnotations(view.annotations)
            view.addAnnotations(annotations)
        }
        print("update MapComponent")
        view.setRegion(MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: currentCoordination.lat, longitude: currentCoordination.lon), latitudinalMeters: 5000, longitudinalMeters: 5000), animated: true)
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

class Coordinator: NSObject, MKMapViewDelegate {
    var parent: MapComponent
    init(_ parent: MapComponent) {
        self.parent = parent
    }

    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        guard let placemark = view.annotation as? RestaurantAnnotation else {return}
        parent.selectedPlace = placemark.id ?? ""
        parent.showPlaceDetails = true
    }
    
//    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
//        guard let placemark = view.annotation as? RestaurantAnnotation else {return}
//    }
}
