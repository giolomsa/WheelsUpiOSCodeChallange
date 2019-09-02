//
//  RootTitle.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class RootCategory{
    
enum SWCategoryType: String{
        case people = "people"
        case films = "films"
        case vheicles = "vheicles"
        case planets = "planets"
        case species = "species"
        case starships = "starships"
    }
    
    var title: String
    var url: String
    var category: SWCategoryType
    
    init(name: String, url: String, category: SWCategoryType) {
        self.title = name
        self.url = url
        self.category = category
    }
}
