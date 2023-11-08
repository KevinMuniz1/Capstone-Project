//
//  menuItemDetails.swift
//  little lemon capstone
//
//  Created by Kevin Muniz on 11/7/23.
//

import CoreData
import SwiftUI

struct menuItemDetails: View {
    
    
    let dish: Dish
    
    var body: some View {
        NavigationStack{
            VStack{
                AsyncImage(url: URL(string: dish.image!)){image in
                    image.image?.resizable()
                }.scaledToFit()
                
                Text(("Price: $\(dish.price!)") )
                    .padding()
                
                Text(dish.descriptions ?? "")
            }
            Spacer()
        }.navigationTitle(dish.title!)
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
        let exampleDish = Dish(context: PersistenceController.shared.container.viewContext)
        exampleDish.price = "10"
        exampleDish.title = "Bruschetta"
        exampleDish.image = "https://github.com/Meta-Mobile-Developer-PC/Working-With-Data-API/blob/main/images/bruschetta.jpg?raw=true"
        exampleDish.descriptions = "Oven-baked bruschetta stuffed with tomatos and herbs."
        return menuItemDetails(dish: exampleDish)
 
}
