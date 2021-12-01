//
//  NewRestaurantView.swift
//  FoodPin
//
//  Created by Ufuk Canlı on 1.12.2021.
//

import SwiftUI

struct NewRestaurantView: View {
    @Environment(\.presentationMode) private var presentationMode
    @StateObject private var viewModel = NewRestaurantViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    Image(uiImage: viewModel.restaurantImage)
                        .resizable()
                        .scaledToFill()
                        .frame(minWidth: 0, maxWidth: .infinity)
                        .frame(height: 200)
                        .background(Color(.systemGray6))
                        .clipShape(RoundedRectangle(cornerRadius: 20.0))
                        .padding(.bottom)
                        .onTapGesture {
                            viewModel.showPhotoOptions.toggle()
                        }
                    
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
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        presentationMode.wrappedValue.dismiss()
                    } label: {
                        Image(systemName: "xmark")
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Text("Save")
                        .font(.headline)
                        .foregroundColor(Color("NavigationBarTitle"))
                }
            }
        }
        .accentColor(.primary)
        .actionSheet(isPresented: $viewModel.showPhotoOptions) {
            ActionSheet(
                title: Text("Choose your photo source"),
                message: nil,
                buttons: [
                    .default(Text("Camera")) {
                        viewModel.photoSource = .camera
                    },
                    .default(Text("Photo Library")) {
                        viewModel.photoSource = .photoLibrary
                    },
                    .cancel()
                ]
            )
        }
        .fullScreenCover(item: $viewModel.photoSource) { source in
            switch source {
            case .photoLibrary:
                ImagePicker(
                    sourceType: .photoLibrary,
                    selectedImage: $viewModel.restaurantImage
                )
                .ignoresSafeArea()
            case .camera:
                ImagePicker(
                    sourceType: .camera,
                    selectedImage: $viewModel.restaurantImage
                )
                .ignoresSafeArea()
            }
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
