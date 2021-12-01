//
//  DiscoverView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

struct DiscoverView: View {
    @StateObject private var manager = CloudKitManager()
    
    var body: some View {
        List(manager.restaurants, id: \.recordID) { restaurant in
            Text(restaurant.object(forKey: "name") as! String)
        }
        .onAppear {
            manager.fetchRestaurants()
        }
        .navigationTitle("Discover")
        .navigationBarTitleDisplayMode(.automatic)
    }
}

struct DiscoverView_Previews: PreviewProvider {
    static var previews: some View {
        DiscoverView()
    }
}
