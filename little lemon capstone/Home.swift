//
//  Home.swift
//  Little Lemon
//
//  Created by Kevin Muniz on 11/3/23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    var body: some View {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem ({Label("Menu", systemImage: "list.dash")})
            UserProfile()
                .tabItem ({Label("User Profile", systemImage: "square.and.pencil")})
        }.navigationBarBackButtonHidden(true)
            
    }
}

#Preview {
    Home()
}
