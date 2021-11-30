//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import SwiftUI

struct RestaurantDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var restaurant: Restaurant
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("restaurant")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity)
                .ignoresSafeArea()
            
            Color.black
                .frame(height: 100)
                .opacity(0.8)
                .cornerRadius(20)
                .padding()
                .overlay(
                    VStack(spacing: 5) {
                        Text(restaurant.name)
                        Text(restaurant.type)
                        Text(restaurant.location)
                        
                        MapView(viewModel: MapViewModel(location: restaurant.location))
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .frame(height: 200)
                            .cornerRadius(20)
                            .padding()
                    }
                    .font(.system(.headline, design: .rounded))
                    .foregroundColor(.white)
                )
        }
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    HStack {
                        Image(systemName: "chevron.left")
                        Text(restaurant.name)
                    }
                    .foregroundColor(.white)
                }
            }
        }
    }
}

struct RestaurantDetailView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantDetailView(
            restaurant: Restaurant(
                name: "N/A",
                type: "N/A",
                location: "N/A",
                image: "N/A",
                isFavorite: false
            )
        )
    }
}
