//
//  Restaurant.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import Foundation

class Restaurant: ObservableObject, Identifiable {
    @Published var id = UUID()
    @Published var name: String
    @Published var type: String
    @Published var location: String
//    @Published var phone: String
//    @Published var description: String
    @Published var image: String
    @Published var isFavorite: Bool
    @Published var rating: Rating?
    
    init(
        name: String,
        type: String,
        location: String,
//        phone: String,
//        description: String,
        image: String,
        isFavorite: Bool = false,
        rating: Rating? = nil
    ) {
            self.name = name
            self.type = type
            self.location = location
//            self.phone = phone
//            self.description = description
            self.image = image
            self.isFavorite = isFavorite
            self.rating = rating
    }
    
    enum Rating: String, CaseIterable {
        case awesome, good, okay, bad, terrible
        
        var image: String {
            switch self {
            case .awesome:
                return "love"
            case .good:
                return "cool"
            case .okay:
                return "happy"
            case .bad:
                return "sad"
            case .terrible:
                return "angry"
            }
        }
    }
}
