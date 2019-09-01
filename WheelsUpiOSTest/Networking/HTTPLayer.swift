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
    let urlSession = URLSession.shared
    
    enum Endpoint{
        case root(String)
        case loadUrl(String)

        var path: String{
            switch self {
            case .root(_):
                return ""
            case .loadUrl(let url):
                return url
            }
        }
    }
    
    func request(at endpoint: Endpoint, completion: @escaping (Data?, URLResponse?, Error?)-> Void){
        var fullURLString = ""
        switch endpoint{
        case .root(_):
            fullURLString = baseURLString
        case .loadUrl(_):
            fullURLString = endpoint.path
        }
        
        
        print(fullURLString)
        let url = URL(string: fullURLString)
        let task = urlSession.dataTask(with: url!) { (data, response, error) in
            completion(data, response, error)
        }
        task.resume()
    }
}
