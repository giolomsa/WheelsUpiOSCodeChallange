//
//  HTTPLayer.swift
//  Weather
//
//  Created by Gio Lomsa on 6/25/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class HTTPLayer{
    
    let baseURLString = "https://swapi.co/api/"
//    let iconBaseURL = "http://openweathermap.org/img/wn/"
//    let iconExtension = "@2x.png"
//    let apiKey = "&units=imperial&appid=8709616a9d372207ada686ff175b754f"
    let urlSession = URLSession.shared
    
    enum Endpoint: String{
        typealias RawValue = String
        
        case root = ""
        case films = "films/"
        case people = "people/"
        case planets = "planets/"
        case species = "species/"
        case starships = "starships/"
        case vehicles = "vehicles/"

    }
    
    func request(at endpoint: Endpoint, completion: @escaping (Data?, URLResponse?, Error?)-> Void){
                
        let fullURLString = baseURLString + endpoint.rawValue
        
        print(fullURLString)
        let url = URL(string: fullURLString)
        let task = urlSession.dataTask(with: url!) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
