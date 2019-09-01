//
//  CategoryDetailsViewModel.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class CategoryDetailsViewMode{
    
    static let categoriesWereSetNotification = Notification.Name.init(rawValue: "gio.lomsa.categoriesWereSetNotification")
    
    let httpLayer = HTTPLayer()
    let networking: APIClient
    
    var genericItem: GenericItem?{
        didSet{
            print("titles were set")
            NotificationCenter.default.post(name: CategoryDetailsViewMode.categoriesWereSetNotification, object: nil)
            
        }
    }
    
    var categories: [Category] = []{
        didSet{
            print("titles were set")
            NotificationCenter.default.post(name: CategoryDetailsViewMode.categoriesWereSetNotification, object: nil)
            
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    func loadDataFromUrl(url: String){
        networking.getCategoryItems(url: url) { (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let item):
                    do {
                        if let json = try JSONSerialization.jsonObject(with: item, options: .mutableContainers) as? [String: Any]{
                            self.genericItem = GenericItem(data: json)
                        }
                        
                    } catch let error as NSError {
                        print(error)
                    }
                
                
            }
        }
    }
    
    func loadCategories(for url: String){
        networking.getCategoriesDetails(url: url, completion: {[weak self] (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let categories):
//                print(categories.results)
                self?.categories = categories.results
            }
        })
    }
}
