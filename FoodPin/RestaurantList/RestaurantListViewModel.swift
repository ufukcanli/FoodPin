//
//  RestaurantListViewModel.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import Foundation

final class RestaurantListViewModel: ObservableObject {
    
    @Published var restaurants = [
        Restaurant(name: "Cafe Deadend", type: "Coffee & Tea Shop", location: "Hong Kong", image: "cafedeadend"),
        Restaurant(name: "Homei", type: "Cafe", location: "Hong Kong", image: "homei"),
        Restaurant(name: "Teakha", type: "Tea House", location: "Hong Kong", image: "teakha"),
        Restaurant(name: "Cafe loisl", type: "Austrian / Causual Drink", location: "Hong Kong", image: "cafeloisl"),
        Restaurant(name: "Petite Oyster", type: "French", location: "Hong Kong", image: "petiteoyster"),
        Restaurant(name: "For Kee Restaurant", type: "Bakery", location: "Hong Kong", image: "forkee"),
        Restaurant(name: "Po's Atelier", type: "Bakery", location: "Hong Kong", image: "posatelier"),
        Restaurant(name: "Bourke Street Backery", type: "Chocolate", location: "Sydney", image: "bourkestreetbakery", isFavorite: false),
        Restaurant(name: "Haigh's Chocolate", type: "Cafe", location: "Sydney", image: "haigh"),
        Restaurant(name: "Palomino Espresso", type: "American / Seafood", location: "Sydney", image: "palomino"),
        Restaurant(name: "Upstate", type: "American", location: "New York", image: "upstate"),
        Restaurant(name: "Traif", type: "American", location: "New York", image: "traif"),
        Restaurant(name: "Graham Avenue Meats", type: "Breakfast & Brunch", location: "New York", image: "graham"),
        Restaurant(name: "Waffle & Wolf", type: "Coffee & Tea", location: "New York", image: "waffleandwolf"),
        Restaurant(name: "Five Leaves", type: "Coffee & Tea", location: "New York", image: "fiveleaves"),
        Restaurant(name: "Cafe Lore", type: "Latin American", location: "New York", image: "cafelore"),
        Restaurant(name: "Confessional", type: "Spanish", location: "New York", image: "confessional"),
        Restaurant(name: "Barrafina", type: "Spanish", location: "London", image: "barrafina"),
        Restaurant(name: "Donostia", type: "Spanish", location: "London", image: "donostia"),
        Restaurant(name: "Royal Oak", type: "British", location: "London", image: "royaloak"),
        Restaurant(name: "CASK Pub and Kitchen", type: "Thai", location: "London", image: "cask")
    ]
    @Published var currentRestaurant: Restaurant? = nil
//    @Published var showOptions = false
    @Published var showError = false
    @Published var showShare = false
    
    func markFavorite() {
        restaurants = restaurants.map { restaurant in
            if restaurant.id == currentRestaurant?.id {
                restaurant.isFavorite.toggle()
            }
            return restaurant
        }
    }
    
}
