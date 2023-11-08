//
//  Menu.swift
//  Little Lemon
//
//  Created by Kevin Muniz on 11/3/23.
//

import SwiftUI
import Foundation
import CoreData



struct Menu: View {
    
    @Environment(\.managedObjectContext) private var viewContext
    
    func getMenuData() {
        
        PersistenceController.shared.clear()
        
        let menuUrl = URL(string: "https://raw.githubusercontent.com/Meta-Mobile-Developer-PC/Working-With-Data-API/main/menu.json")
        
        guard let menuUrl = menuUrl else {
            print("This is not valid")
            return
        }
        let request = URLRequest(url: menuUrl)
        
        let task = URLSession.shared.dataTask(with: request){data,response, error in
            if let data = data {
                let fullMenu = try? JSONDecoder().decode(MenuList.self, from: data)
                for items in fullMenu!.menu {
                    let newDish = Dish(context: viewContext)
                    newDish.title = items.title
                    newDish.price = items.price
                    newDish.image = items.image
                    newDish.descriptions = items.description
                    print(items.title)
                    print(items.price)
                    print(items.image)
                    print(items.description)
                    print(items.category)
                    
                }
                try? viewContext.save()
            } else {
                print("Invalid")
                return
            }
        }
        
        task.resume()
    }
    
    var body: some View {
        VStack {
            Text("Little Lemon")
                .font(.largeTitle)
                .foregroundStyle(.yellow)
            Text("Chicago")
                .font(.title2)
            Text("Description")
            NavigationStack{
            FetchedObjects(){(dishes: [Dish]) in
                List {
                    ForEach(dishes, id: \.id){dish in
                        NavigationLink(destination: menuItemDetails(dish: dish)){
                            HStack(alignment: .center, spacing: 50) {
                                Text(dish.title!)
                                Text(dish.price!)
                                AsyncImage(url: URL(string: dish.image!)){image in
                                    image.image?.resizable()
                                }.frame(width: 50, height: 50, alignment: .trailing)
                            }
                        }
                    }
                }
            }
        }
        

        }.onAppear(perform: {
            getMenuData()
        })
    }
}


#Preview {
    Menu()
}
