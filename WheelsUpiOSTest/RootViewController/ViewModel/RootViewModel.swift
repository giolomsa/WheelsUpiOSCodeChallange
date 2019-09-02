//
//  RootViewModel.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class RootViewModel{
    
    static let rootElementsWereSetNotification = Notification.Name.init(rawValue: "gio.lomsa.rootElementsWereSetNotification")
    
    let httpLayer = HTTPLayer()
    let networking: APIClient
    
    var rootElements: [RootCategory] = []{
        didSet{
            print("titles were set")
            NotificationCenter.default.post(name: RootViewModel.rootElementsWereSetNotification, object: nil)
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    // load root elements
    func loadRootElements(){
        networking.getRootObjects {[weak self] (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let items):
                var _items = [RootCategory]()
                
                for title in items{
                    let rootElement = RootCategory(name: title.key, url: title.value, category: RootCategory.SWCategoryType(rawValue: title.key) ?? RootCategory.SWCategoryType.films)
                    _items.append(rootElement)
                }
                self?.rootElements = _items.sorted(by: {
                    $0.title < $1.title
                })
            }
        }
    }
}
