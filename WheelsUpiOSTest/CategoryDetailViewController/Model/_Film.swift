//
//  Film.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class _Film {
    var episode_id: Int
    var opening_crawl: String
    var director: String
    var producer: String
//    string -- The name(s) of the producer(s) of this film. Comma separated.
    var release_date: Date
    var species: [String]
    var starships: [String]
    var vehicles: [String]
    var characters: [String]
    var planets: [String]
    var url: String
    var edited: String
    
    private enum CodingKeys: String, CodingKey{
        case title = "title"
        case created = "created"
        case name = "name"
        case episode_id = "episode_id"
        case opening_crawl = "opening_crawl"
        case director = "director"
        case producer = "producer"
        case release_date = "release_date"
        case species = "species"
        case starships = "starships"
        case vehicles = "vehicles"
        case characters = "characters"
        case planets = "planets"
        case url = "url"
        case edited = "edited"
    }
    
//    init(name: String, created: String, title: String, episode_id: Int, opening_crawl: String, director: String, producer: String, release_date: Date, species: [String], starships: [String],
//    vehicles: [String], characters: [String], planets: [String], url: String, edited: String){
//        self.episode_id = episode_id
//        self.opening_crawl = opening_crawl
//        self.director = director
//        self.producer = producer
//        self.release_date = release_date
//        self.species = species
//        self.starships = starships
//        self.vehicles = vehicles
//        self.characters = characters
//        self.planets = planets
//        self.url = url
//        self.edited = edited
//        super.init(name: name, created: created, title: title)
//    }
//
//    required init(from decoder: Decoder) throws {
//        fatalError("init(from:) has not been implemented")
//    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.episode_id = try container.decode(Int.self, forKey: .episode_id)
        self.opening_crawl = try container.decode(String.self, forKey: .opening_crawl)
        self.director = try container.decode(String.self, forKey: .director)
        self.producer = try container.decode(String.self, forKey: .producer)
        self.release_date = try container.decode(Date.self, forKey: .release_date)
        self.species = try container.decode([String].self, forKey: .species)
        self.starships = try container.decode([String].self, forKey: .starships)
        self.vehicles = try container.decode([String].self, forKey: .vehicles)
        self.characters = try container.decode([String].self, forKey: .characters)
        self.planets = try container.decode([String].self, forKey: .planets)
        self.url = try container.decode(String.self, forKey: .url)
        self.edited = try container.decode(String.self, forKey: .edited)
//        try super.init(from: decoder)
    }

}
