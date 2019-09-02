//
//  CategoryDetailsViewModel.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class CategoryDetailsViewMode{
    
    static let categoryElementsWereSetNotification = Notification.Name.init(rawValue: "gio.lomsa.categoryElementsWereSetNotification")
    
    let httpLayer = HTTPLayer()
    let networking: APIClient
    
    var categoryElements: [CategoryElement] = []{
        didSet{
            NotificationCenter.default.post(name: CategoryDetailsViewMode.categoryElementsWereSetNotification, object: nil)
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    func loadCategoryElements(for url: String){
        networking.getCategoryElements(urlString: url, completion: {[weak self] (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let categories):
//                print(categories.results)
                self?.categoryElements = categories.results
            }
        })
    }
}
