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
            ForEach(viewModel.restaurants) { restaurant in
                BasicTextImageRow(
                    name: restaurant.name,
                    type: restaurant.type,
                    location: restaurant.location,
                    isFavorite: restaurant.isFavorite
                )
                // TODO: Swipe actions iOS15
                .contextMenu {
                    Button {
                        viewModel.showError.toggle()
                    } label: {
                        HStack {
                            Text("Reserve a table")
                            Image(systemName: "phone")
                        }
                    }
                    
                    Button {
                        viewModel.currentRestaurant = restaurant
                        viewModel.markFavorite()
                    } label: {
                        HStack {
                            Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")
                            Image(systemName: restaurant.isFavorite ? "heart.fill" : "heart")
                        }
                    }
                    
                    Button {
                        viewModel.currentRestaurant = restaurant
                        viewModel.showShare.toggle()
                    } label: {
                        HStack {
                            Text("Share this restaurant")
                            Image(systemName: "square.and.arrow.up")
                        }
                    }
                }
                .onTapGesture {
                    viewModel.showOptions.toggle()
                    viewModel.currentRestaurant = restaurant
                }
                .actionSheet(isPresented: $viewModel.showOptions) {
                    ActionSheet(
                        title: Text("What do you want to do?"),
                        message: nil,
                        buttons: [
                            .default(Text("Reserve a table")) {
                                viewModel.showError.toggle()
                            },
                            .default(Text(restaurant.isFavorite ? "Remove from favorites" : "Mark as favorite")) {
                                viewModel.markFavorite()
                            },
                            .cancel()
                        ]
                    )
                }
                .alert(isPresented: $viewModel.showError) {
                    Alert(
                        title: Text("Not yet available"),
                        message: Text("Sorry, this feature is not available yet. Please try again later."),
                        primaryButton: .default(Text("OK")),
                        secondaryButton: .cancel()
                    )
                }
                .sheet(isPresented: $viewModel.showShare) {
                    let defaultText = "Just checking in at \(restaurant.name)"
                    if let imageToShare = UIImage(named: restaurant.image) {
                        ActivityView(activityItems: [defaultText, imageToShare])
                    } else {
                        ActivityView(activityItems: [defaultText])
                    }
                }
            }
            .onDelete { indexSet in
                viewModel.restaurants.remove(atOffsets: indexSet)
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
    var isFavorite: Bool
    
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
                
                if isFavorite {
                    Spacer()
                    
                    Image(systemName: "heart.fill")
                        .foregroundColor(.yellow)
                    
                    Spacer()
                }
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
