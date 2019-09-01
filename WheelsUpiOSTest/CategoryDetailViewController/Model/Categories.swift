//
//  Categories.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation
struct Categories: Decodable {
    let categories: [CategoryItem]
    
    enum CategoryKey: CodingKey {
        case categories
    }
    
    enum CategoriesTypeKey: CodingKey {
        case type
    }
    
    enum CategoriesTypes: String, Decodable {
        case films = "films"
        case people = "people"
        
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CategoryKey.self)
        var categoriesArrayForType = try container.nestedUnkeyedContainer(forKey: DrinksKey.drinks)
        var drinks = [Drink]()
        
        var drinksArray = drinksArrayForType
        while(!drinksArrayForType.isAtEnd) {
            let drink = try drinksArrayForType.nestedContainer(keyedBy: DrinkTypeKey.self)
            let type = try drink.decode(DrinkTypes.self, forKey: DrinkTypeKey.type)
            switch type {
            case .water, .orangeJuice:
                print("found drink")
                drinks.append(try drinksArray.decode(Drink.self))
            case .beer:
                print("found beer")
                drinks.append(try drinksArray.decode(Beer.self))
            }
        }
        self.drinks = drinks
    }
}
