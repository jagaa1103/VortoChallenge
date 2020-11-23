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
    
    func searchRestaurants(text: String, coordinate: Coordinate?){
//        fetchRestaurants(text: text, coordinate: coordinate)
    }
    
    
    

}
