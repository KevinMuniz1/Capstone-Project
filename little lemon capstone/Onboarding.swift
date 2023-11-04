//
//  Onboarding.swift
//  Little Lemon
//
//  Created by Kevin Muniz on 11/2/23.
//

import SwiftUI

let kFirstName = "Default first name key"
let kLastName = "Default Last name key"
let kEmail = " Default email key"
let kIsLoggedIn = "KIsLoggedIn"


struct Onboarding: View {
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    @State private var email: String = ""
    @State var isLoggedIn: Bool = false
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Image(uiImage: .littleLemonLogo)
                    .resizable()
                    .frame(width: 200, height: 200)
                TextField("First Name", text: $firstName)
                    .textFieldStyle(.roundedBorder)
                TextField("Last Name", text: $lastName)
                    .textFieldStyle(.roundedBorder)
                TextField("email",text: $email)
                    .textFieldStyle(.roundedBorder)
                Button("Register"){
                    if !firstName.isEmpty && !lastName.isEmpty && !email.isEmpty {
                        UserDefaults.standard.setValue(firstName, forKey: kFirstName)
                        UserDefaults.standard.setValue(lastName, forKey: kLastName)
                        UserDefaults.standard.setValue(email, forKey: kEmail)
                        UserDefaults.standard.setValue(true, forKey: kIsLoggedIn)
                        isLoggedIn = true
                    } else {
                        return
                    }
                }
                .buttonBorderShape(.capsule)
                .buttonStyle(.bordered)
                .navigationDestination(isPresented: $isLoggedIn, destination: {Home()} )
                
            }.padding(4)
        }.onAppear(){
            if UserDefaults.standard.bool(forKey: kIsLoggedIn){
                isLoggedIn = true
            }
        }
    }
}

#Preview {
    Onboarding()
}
