//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

struct NewRestaurantView: View {
    @State private var restaurantName = ""
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    FormTextField(
                        label: "NAME",
                        placeholder: "Fill in the restaurant name",
                        value: .constant("")
                    )
                    
                    FormTextField(
                        label: "TYPE",
                        placeholder: "Fill in the restaurant type",
                        value: .constant("")
                    )
                    
                    FormTextField(
                        label: "ADDRESS",
                        placeholder: "Fill in the restaurant address",
                        value: .constant("")
                    )
                    
                    FormTextField(
                        label: "PHONE",
                        placeholder: "Fill in the restaurant phone",
                        value: .constant("")
                    )
                    
                    FormTextView(
                        label: "DESCRIPTION",
                        value: .constant(""),
                        height: 100
                    )
                }
                .padding()
            }
            .navigationTitle("New Restaurant")
        }
    }
}

struct NewRestaurantView_Previews: PreviewProvider {
    static var previews: some View {
        NewRestaurantView()
    }
}

struct FormTextField: View {
    var label: String
    var placeholder: String = ""
    @Binding var value: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            
            TextField(placeholder, text: $value)
                .font(.system(.body, design: .rounded))
                .textFieldStyle(PlainTextFieldStyle())
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.vertical, 10)
        }
    }
}

struct FormTextView: View {
    var label: String
    @Binding var value: String
    var height: CGFloat = 200.0

    var body: some View {
        VStack(alignment: .leading) {
            Text(label.uppercased())
                .font(.system(.headline, design: .rounded))
                .foregroundColor(Color(.darkGray))
            
            TextEditor(text: $value)
                .frame(maxWidth: .infinity)
                .frame(height: height)
                .padding(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 5)
                        .stroke(Color(.systemGray5), lineWidth: 1)
                )
                .padding(.top, 10)
        }
    }
}
