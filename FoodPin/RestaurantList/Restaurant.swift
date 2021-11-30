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
