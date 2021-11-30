//
//  RestaurantDetailView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import SwiftUI

struct RestaurantDetailView: View {
    @State private var currentRating: Restaurant.Rating? = nil
    @State private var showReview = false
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
                                if let currentRating = currentRating {
                                    Image(currentRating.image)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .padding([.leading, .top])
                                        .transition(.scale)
                                } else if let rating = restaurant.rating {
                                    Image(rating.image)
                                        .resizable()
                                        .frame(width: 60, height: 60)
                                        .padding([.leading, .top])
                                        .transition(.scale)
                                }
                                
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
                                
                Text(restaurant.description)
                    .padding()
                
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
                        
                        Text(restaurant.phone)
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
                
                Button {
                    showReview.toggle()
                } label: {
                    Text("Rate it")
                        .font(.system(size: 25.0, design: .rounded))
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .foregroundColor(.white)
                }
                .frame(height: 50)
                .background(Color("NavigationBarTitle"))
                .clipShape(RoundedRectangle(cornerRadius: 20))
                .padding([.horizontal, .bottom])
                .fullScreenCover(isPresented: $showReview) {
                    ReviewView(currentRating: $currentRating, restaurant: restaurant)
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
                phone: "N/A",
                description: "N/A",
                image: "N/A"
            )
        )
    }
}
