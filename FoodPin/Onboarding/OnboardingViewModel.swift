//
//  OnboardingViewModel.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import Foundation

final class OnboardingViewModel: ObservableObject {
    
    @Published var onboardingItems = [
        OnboardingItem(
            id: 1,
            pageHeading: "CREATE YOUR OWN FOOD GUIDE",
            pageSubHeading: "Pin your favorite restaurants and create your own food guide",
            pageImage: "onboarding-1"
        ),
        OnboardingItem(
            id: 2,
            pageHeading: "SHOW YOU THE LOCATION",
            pageSubHeading: "Search and locate your favorite restaurant on Maps",
            pageImage: "onboarding-2"
        ),
        OnboardingItem(
            id: 3,
            pageHeading: "DISCOVER GREAT RESTAURANTS",
            pageSubHeading: "Find restaurants shared by your friends and other foodies",
            pageImage: "onboarding-3"
        )
    ]
    
    @Published var currentPageID = 1
    
    var isCurrentPage: Bool {
        currentPageID == onboardingItems.count
    }
    
    var shouldNextPage: Bool {
        currentPageID < onboardingItems.count
    }
    
}
