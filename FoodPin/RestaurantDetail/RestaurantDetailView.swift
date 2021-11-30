//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import SwiftUI

struct RestaurantDetailView: View {
    var restaurant: Restaurant
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("restaurant")
                    .resizable()
                    .scaledToFit()
                    .overlay(
                        VStack(alignment: .leading) {
                            HStack(alignment: .top) {
                                Spacer()
                                
                                Image(systemName: restaurant.isFavorite ? "heart.fill": "heart")
                                    .font(.system(size: 30))
                                    .foregroundColor(restaurant.isFavorite ? .yellow : .white)
                                    .padding()
                            }
                            
                            Spacer()
                            
                            VStack(alignment: .leading, spacing: 5) {
                                Text(restaurant.name)
                                    .font(.custom("Nunito-Regular", size: 35, relativeTo: .largeTitle))
                                    .bold()
                                
                                Text(restaurant.type)
                                    .font(.system(.headline, design: .rounded))
                                    .padding(.all, 5)
                                    .background(Color.black)
                            }
                            .foregroundColor(.white)
                            .padding()
                        }
                    )
                                
                //                Text(restaurant.description)
                //                    .padding()
                
                HStack(alignment: .top) {
                    VStack(alignment: .leading) {
                        Text("ADDRESS")
                            .font(.system(.headline, design: .rounded))
                        
                        Text(restaurant.location)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    
                    VStack(alignment: .leading) {
                        Text("PHONE")
                            .font(.system(.headline, design: .rounded))
                        
                        //                        Text(restaurant.phone)
                    }
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
                .padding(.horizontal)
                
                NavigationLink(destination: MapView(viewModel: MapViewModel(location: restaurant.location))) {
                    MapView(viewModel: MapViewModel(location: restaurant.location))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .cornerRadius(20)
                        .padding()
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
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
