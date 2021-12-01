//
//  NewRestaurantViewModel.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

enum PhotoSource: Identifiable {
    case photoLibrary, camera
    var id: Int { hashValue }
}

final class NewRestaurantViewModel: ObservableObject {
    
    @Published var restaurantName = ""
    @Published var restaurantImage = UIImage(named: "newphoto")!
    @Published var showPhotoOptions = false
    @Published var photoSource: PhotoSource?
        
}
