//
//  Menu.swift
//  Little Lemon
//
//  Created by Kevin Muniz on 11/3/23.
//

import SwiftUI

struct Menu: View {
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.largeTitle)
                .foregroundStyle(.yellow)
            Text("Chicago")
                .font(.title2)
            Text("Description")
            List {
                Text("This is a test 2")
                }
            }
        }
    }


#Preview {
    Menu()
}
