//
//  OnboardingView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("hasViewedWalkthrough") var hasViewedWalkthrough = false
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = OnboardingViewModel()
    
    init() {
        UIPageControl.appearance().currentPageIndicatorTintColor = .systemIndigo
        UIPageControl.appearance().pageIndicatorTintColor = .lightGray
    }
    
    var body: some View {
        VStack {
            TabView(selection: $viewModel.currentPageID) {
                ForEach(viewModel.onboardingItems) { item in
                    OnboardingPage(
                        image: item.pageImage,
                        heading: item.pageHeading,
                        subHeading: item.pageSubHeading
                    )
                    .tag(item.id)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .automatic))
            .animation(.default, value: viewModel.currentPageID)
            
            VStack(spacing: 20) {
                Button {
                    if viewModel.shouldNextPage {
                        viewModel.currentPageID += 1
                    } else {
                        hasViewedWalkthrough = false // set to true after development
                        presentationMode.wrappedValue.dismiss()
                    }
                } label: {
                    Text(viewModel.isCurrentPage ? "GET STARTED" : "NEXT")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .padding(.horizontal, 50)
                        .background(Color(.systemIndigo))
                        .cornerRadius(25)
                }
                
                if viewModel.shouldNextPage {
                    Button {
                        hasViewedWalkthrough = false // set to true after development
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Text("Skip")
                            .font(.headline)
                            .foregroundColor(Color(.darkGray))
                    }
                }
            }
            .padding(.bottom)
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}

struct OnboardingPage: View {
    var image: String
    var heading: String
    var subHeading: String
    
    var body: some View {
        VStack(spacing: 70) {
            Image(image)
                .resizable()
                .scaledToFit()
            
            VStack(spacing: 10) {
                Text(heading)
                    .font(.headline)
                
                Text(subHeading)
                    .font(.body)
                    .foregroundColor(.gray)
            }
            .padding(.horizontal, 40)
            .multilineTextAlignment(.center)
            
            Spacer()
        }
        .padding(.top)
    }
}
