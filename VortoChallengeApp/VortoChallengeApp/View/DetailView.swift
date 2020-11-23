//
//  DetailView.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.22.
//

import Foundation
import SwiftUI

struct DetailView: View {
    
    var restaurant: Restaurant
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Spacer()
                Button(action: { self.isPresented = false }){
                    Text("Dismiss")
                }
            }.padding()
            VStack {
                ImageView(withURL: restaurant.image_url).padding()
                Text(restaurant.name)
                    .font(.system(size: 30)).padding()
                VStack {
                    Text("Phone: \(restaurant.phone)")
                    Text("Distance: \(Constants.calculateDistanceByMiles(meter: restaurant.distance)) MI")
                    Text(restaurant.location.display_address[0]).font(.system(size: 15)).foregroundColor(.gray)
                }.padding()
            }
            Spacer()
        }.padding()
    }
}
