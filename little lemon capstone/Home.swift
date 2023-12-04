//
//  Home.swift
//  Little Lemon
//
//  Created by Kevin Muniz on 11/3/23.
//

import SwiftUI

struct Home: View {
    let persistence = PersistenceController.shared
    init() {
        UITabBar.appearance().unselectedItemTintColor = UIColor.black
    }
    var body: some View {
        ZStack {
        TabView {
            Menu()
                .environment(\.managedObjectContext, persistence.container.viewContext)
                .tabItem ({Label("Menu", systemImage: "list.dash")})
            UserProfile()
                .tabItem ({Label("User Profile", systemImage: "square.and.pencil")})
        }.navigationBarBackButtonHidden(true)
                .accentColor(.yellow)
                
    }
}
}

#Preview {
    Home()
}
