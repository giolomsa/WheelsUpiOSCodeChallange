//
//  HTTPLayer.swift
//  Weather
//
//  Created by Gio Lomsa on 6/25/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class HTTPLayer{
    
//    let baseURLString = "https://swapi.co/api/"
    let urlSession = URLSession.shared
    
    enum Endpoint{
        case root
        case fromUrl(String)

        var path: String{
            switch self {
            case .root:
                return "https://swapi.co/api/"
            case .fromUrl(let url):
                return url
            }
        }
    }
    
    func request(at endpoint: Endpoint, completion: @escaping (Data?, URLResponse?, Error?)-> Void){
        
        let urlString = endpoint.path
                
        guard let url = URL(string: urlString) else {return }
        let task = urlSession.dataTask(with: url) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
