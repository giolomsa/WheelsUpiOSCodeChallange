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
    
    func getRootObjects(completion: @escaping (Result<[String: String]>)-> Void){
        
        self.httpLayer.request(at: .root("")) { (data, response, error) in
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
                let rootTitles = try decoder.decode([String: String].self, from: data)
                completion(.success(rootTitles))
            }catch let error{
                print(error.localizedDescription)
            }
        }
    }
    
    func getCategoriesDetails(url: String, completion: @escaping (Result<CategoriesResults>)-> Void){
        
        self.httpLayer.request(at: .loadUrl(url)) { (data, response, error) in
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
                let rootTitles = try decoder.decode(CategoriesResults.self, from: data)
                completion(.success(rootTitles))
            }catch let error{
                print(error.localizedDescription)
            }
            
            
        }
    }
    
    func getCategoryItems(url: String, completion: @escaping (Result<Data>)-> Void){
        
        self.httpLayer.request(at: .loadUrl(url)) { (data, response, error) in
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
