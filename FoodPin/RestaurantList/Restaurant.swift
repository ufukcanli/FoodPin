//
//  Restaurant.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import Foundation

struct Restaurant: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let location: String
    let image: String
    var isFavorite: Bool
}
