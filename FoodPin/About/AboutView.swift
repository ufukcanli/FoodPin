//
//  AboutView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

enum WebLink: String {
    case rateUs = "https://www.apple.com/ios/app-store"
    case feedback = "https://ufukcanli.com"
    case twitter = "https://twitter.com/"
    case facebook = "https://facebook.com/"
    case instagram = "https://instagram.com/ufukcanli"
}

struct AboutView: View {
    var body: some View {
        NavigationView {
            List {
                Image("about")
                    .resizable()
                    .scaledToFit()
                
                Section {
                    Link(destination: URL(string: WebLink.rateUs.rawValue)!) {
                        Label("Rate us on App Store", image: "store")
                            .foregroundColor(.primary)
                    }
                    Label("Tell us your feedback", image: "chat")
                }
                
                Section {
                    Label("Twitter", image: "twitter")
                    Label("Facebook", image: "facebook")
                    Label("Instagram", image: "instagram")
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
