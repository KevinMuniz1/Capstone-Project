//
//  UserProfile.swift
//  Little Lemon
//
//  Created by Kevin Muniz on 11/3/23.
//

import SwiftUI

struct UserProfile: View {
    let firstName = UserDefaults.standard.string(forKey: kFirstName) ?? ""
    let lastName = UserDefaults.standard.string(forKey: kLastName) ?? ""
    let email = UserDefaults.standard.string(forKey: kEmail) ?? ""
    @Environment(\.presentationMode) var presentation
    var body: some View {
        ZStack {
            Color(.littleLemonGreen)
                .ignoresSafeArea()
            VStack {
                Text("Personal Information")
                Image(uiImage: .profilePicturePlaceholder)
                    .resizable()
                    .frame(width: 300, height: 300)
                    .clipShape(.circle)
                    .overlay {
                        Circle().stroke(.black, lineWidth: 4)
                    }
                Text("First Name: \(firstName)")
                    .padding(10)
                Text("Last Name: \(lastName)")
                    .padding(5)
                Text("Email: \(email)")
                    .padding(5)
                Button("Logout"){
                    UserDefaults.standard.setValue(false, forKey: kIsLoggedIn)
                    self.presentation.wrappedValue.dismiss()
                }.frame(width: 100, height: 50)
                    .background(.white)
                    .foregroundStyle(.black)
                    .clipShape(.buttonBorder)
                    .padding()
                Spacer()
            }.foregroundStyle(.white)
        }
    }
}

#Preview {
    UserProfile()
}
