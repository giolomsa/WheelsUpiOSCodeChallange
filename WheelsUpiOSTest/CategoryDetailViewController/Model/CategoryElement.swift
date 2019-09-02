//
//  CategoryItem.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class CategoryElement: Codable{
    
    var title: String?
    var name: String?
    var birth_year: String?
    var opening_crawl: String?
    var model: String?
    var classification: String?
    var diameter: String?
    var created: String
    var url: String
}

class CategoriesResults:Codable{
    var results: [CategoryElement]
    
}
