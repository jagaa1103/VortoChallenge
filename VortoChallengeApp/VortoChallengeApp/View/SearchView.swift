//
//  SearchView.swift
//  VortoChallengeApp
//
//  Created by Enkhjargal Gansukh on 2020.11.20.
//

import SwiftUI
import Combine

struct SearchView: View {
    @ObservedObject var viewModel = SearchViewModel()
    @State var inputText = ""
    @State var editState = false
    var body: some View {
        ZStack {
            VStack {
                TextField("Search", text: $inputText, onEditingChanged: {editState=$0}, onCommit: {
                        print(inputText)
                    viewModel.searchRestaurants(text: inputText)
                })
                .keyboardType(.webSearch)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List{
                    ForEach(viewModel.restaurants){
                        ListItem(restaurant: $0)
                    }
                }
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .edgesIgnoringSafeArea(.all)
    }
    
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
