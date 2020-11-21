//
//  ListView.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import SwiftUI

struct RestaurantListView: View {
    @Binding var restaurants: [Restaurant]
    var body: some View {
        VStack {
            ScrollView {
                List {
                    ForEach(restaurants){ res in
                        Text(res.name)
                    }
                }
            }
//            List(restaurants) { restaurant in
//                ListItem(restaurant: restaurant)
//            }
            
        }
        .background(Color.green)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//struct ListView_Previews: PreviewProvider {
//    static var previews: some View {
//    }
//}
