//
//  MenuItem.swift
//  little lemon capstone
//
//  Created by Kevin Muniz on 11/4/23.
//

import Foundation

struct MenuItem: Decodable, Identifiable {
    
    enum CodingKeys: String, CodingKey { case
    title, price, image, description, category
    }
    
    var id = UUID()
    let title: String
    let price: String
    let image: String
    let description: String
    let category: String

    
    
}
