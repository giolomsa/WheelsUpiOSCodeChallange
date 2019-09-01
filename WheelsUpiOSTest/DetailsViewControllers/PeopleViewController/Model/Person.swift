//
//  Person.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class Person: DetailItems, Codable {
    var name: String
    var birth_year: String
    var eye_color: String
    var gender: String
    var hair_color: String
    var height: String
    var homeworld: String
    var mass: String
    var skin_color: String
    var created: String
    var edited: String
    var films: [String]
    var species: [String]
    var starships: [String]
    var url: String
    var vehicles: [String]
}

