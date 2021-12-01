//
//  FoodPinApp.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 30.11.2021.
//

import SwiftUI

@main
struct FoodPinApp: App {
    
//    init() {
//        let navBarAppearance = UINavigationBarAppearance()
//        navBarAppearance.largeTitleTextAttributes = [
//            .foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed,
//            .font: UIFont(name: "ArialRoundedMTBold", size: 35)!
//        ]
//        navBarAppearance.titleTextAttributes = [
//            .foregroundColor: UIColor(named: "NavigationBarTitle") ?? UIColor.systemRed,
//            .font: UIFont(name: "ArialRoundedMTBold", size: 20)!
//        ]
//        navBarAppearance.backgroundColor = .clear
//        navBarAppearance.backgroundEffect = .none
//        navBarAppearance.shadowColor = .clear
//
//        UINavigationBar.appearance().standardAppearance = navBarAppearance
//        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
//        UINavigationBar.appearance().compactAppearance = navBarAppearance
//    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}

struct MainView: View {
    @State private var selectedTabIndex = 0
    
    var body: some View {
        TabView(selection: $selectedTabIndex) {
            RestaurantListView()
                .tabItem {
                    Label("Favorites", systemImage: "tag.fill")
                }
                .tag(0)
            
            DiscoverView()
                .tabItem {
                    Label("Discover", systemImage: "wand.and.rays")
                }
                .tag(1)
            
            AboutView()
                .tabItem {
                    Label("About", systemImage: "square.stack")
                }
                .tag(2)
        }
        .accentColor(.primary)
    }
}
