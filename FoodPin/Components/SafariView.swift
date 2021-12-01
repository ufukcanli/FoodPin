//
//  SafariView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI
import SafariServices

struct SafariView: UIViewControllerRepresentable {
    
    var url: URL
    
    func makeUIViewController(context: Context) -> SFSafariViewController {
        SFSafariViewController(url: url)
    }
    
    func updateUIViewController(_ uiViewController: SFSafariViewController, context: Context) {}
    
}
