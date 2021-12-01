//
//  AboutView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

enum WebLink: String, Identifiable {
    case rateUs = "https://www.apple.com/ios/app-store"
    case feedback = "https://ufukcanli.com"
    case twitter = "https://twitter.com/"
    case facebook = "https://facebook.com/"
    case instagram = "https://instagram.com/ufukcanli"
    
    var id: UUID { UUID() }
}

struct AboutView: View {
    @State private var link: WebLink?
    
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
                        .onTapGesture {
                            link = .feedback
                        }
                }
                
                Section {
                    Label("Twitter", image: "twitter")
                        .onTapGesture {
                            link = .twitter
                        }
                    
                    Label("Facebook", image: "facebook")
                        .onTapGesture {
                            link = .facebook
                        }
                    
                    Label("Instagram", image: "instagram")
                        .onTapGesture {
                            link = .instagram
                        } 
                }
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("About")
            .navigationBarTitleDisplayMode(.automatic)
        }
        .sheet(item: $link) { item in
            if let url = URL(string: item.rawValue) {
                WebView(url: url)
            }
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
