//
//  ListItem.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import SwiftUI

struct ListItem: View {
    let restaurant: Restaurant
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(restaurant.name).font(.system(size: 20))
                HStack(spacing: 20) {
                    Text(restaurant.location.display_address[0]).font(.system(size: 15)).foregroundColor(.gray)
                    Text("\(Constants.calculateDistanceByMiles(meter: restaurant.distance))MI").font(.system(size: 15)).foregroundColor(.gray)
                }
            }
            Spacer()
            VStack(spacing: 5) {
                Text(String(format: "%.1f", restaurant.rating)).font(.system(size: 20))
                Text("Rating").font(.system(size: 10))
            }
        }
        .padding()
    }
}
