//
//  APIClient.swift
//  Weather
//
//  Created by Gio Lomsa on 6/25/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class APIClient{
    
    let httpLayer: HTTPLayer
    var defaultError: NSError = NSError(domain: "", code: 1, userInfo: nil)
    
    enum Result<Element>{
        case success(Element)
        case failure(NSError)
    }
    
    init(httpLayer: HTTPLayer){
        self.httpLayer = httpLayer
    }
    
    //load root items
    func getRootObjects(completion: @escaping (Result<[String: String]>)-> Void){
        
        self.httpLayer.request(at: .root) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode.isSuccessHTTPCode,
                let data = data
                else {
                    if let error = error{
                        completion(.failure(error as NSError))
                    }
                    return
                }
            do{
                let decoder = JSONDecoder()
                let rootItems = try decoder.decode([String: String].self, from: data)
                completion(.success(rootItems))
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    //load category items from selected category using url
    func getCategoryElements(urlString: String, completion: @escaping (Result<CategoriesResults>)-> Void){
        
        self.httpLayer.request(at: .fromUrl(urlString)) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode.isSuccessHTTPCode,
                let data = data
                else {
                    
                    if let error = error{
                        completion(.failure(error as NSError))
                    }
                    return
            }
            do{
                let decoder = JSONDecoder()
                let categoryElements = try decoder.decode(CategoriesResults.self, from: data)
                completion(.success(categoryElements))
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    //load selected elements details
    func getElementDetails(urlString: String, completion: @escaping (Result<Data>)-> Void){
        
        self.httpLayer.request(at: .fromUrl(urlString)) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode.isSuccessHTTPCode,
                let data = data
                else {
                    
                    if let error = error{
                        completion(.failure(error as NSError))
                    }
                    return
            }
                completion(.success(data))            
        }
    }
}
