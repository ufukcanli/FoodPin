//
//  RestaurantListView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import SwiftUI

struct RestaurantListView: View {
    @StateObject private var viewModel = RestaurantListViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.restaurantNames.indices, id: \.self) { index in
                BasicTextImageRow(
                    name: viewModel.restaurantNames[index],
                    type: viewModel.restaurantTypes[index],
                    location: viewModel.restaurantLocations[index]
                )
                .onTapGesture {
                    viewModel.showOptions.toggle()
                }
                .actionSheet(isPresented: $viewModel.showOptions) {
                    ActionSheet(
                        title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Reserve a table")) {
                                
                            },
                            .default(Text("Mark as favorite")) {
                                
                            },
                            .cancel()
                        ]
                    )
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        RestaurantListView()
    }
}

struct BasicTextImageRow: View {
    var imageName: String = "restaurant"
    var name: String
    var type: String
    var location: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 20) {
            Image(imageName)
                .resizable()
                .frame(width: 120, height: 118)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
        }
    }
}

struct FullTextImageRow: View {
    var imageName: String = "restaurant"
    var name: String
    var type: String
    var location: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 200)
                .cornerRadius(20)
            
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(.title2, design: .rounded))
                
                Text(type)
                    .font(.system(.body, design: .rounded))
                
                Text(location)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundColor(.gray)
            }
            .padding([.horizontal, .bottom])
        }
    }
}
