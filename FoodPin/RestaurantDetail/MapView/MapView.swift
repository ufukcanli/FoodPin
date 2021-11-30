//
//  MapView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import SwiftUI
import MapKit

struct MapView: View {
    @ObservedObject var viewModel: MapViewModel
    
    var body: some View {
        Map(
            coordinateRegion: $viewModel.region,
            annotationItems: [viewModel.annotatedItem])
        { item in
            MapMarker(coordinate: item.coordinate, tint: .red)
        }
    }
    
    
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView(
            viewModel: MapViewModel(
                location: "54 Frith Street London W1D 4SL United Kingdom"
            )
        )
    }
}
