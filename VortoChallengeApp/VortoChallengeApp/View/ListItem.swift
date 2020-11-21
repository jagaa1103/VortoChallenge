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
        
        VStack {
            Text(restaurant.name)
            Text("" + String(format: "%.1f", restaurant.distance / 1609.344) + "MI")
        }
    }
}

//struct ListItem_Previews: PreviewProvider {
//    static var previews: some View {
//        ListItem(restaurant: restaurant.name)
//    }
//}
