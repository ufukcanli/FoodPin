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
        Text(restaurant.name)
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
