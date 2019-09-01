//
//  RootViewModel.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class RootViewModel{
    
    static let rootTitlesWereSetNotification = Notification.Name.init(rawValue: "gio.lomsa.rootRitlesWereSetNotification")
    
    let httpLayer = HTTPLayer()
    let networking: APIClient
    
    var titles: [RootCategory] = []{
        didSet{
            print("titles were set")
            NotificationCenter.default.post(name: RootViewModel.rootTitlesWereSetNotification, object: nil)
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    func loadRoot(){
        networking.getRootObjects {[weak self] (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let titles):
                var _titles = [RootCategory]()
                
                for title in titles{
                    let rootTitle = RootCategory(name: title.key, url: title.value, category: RootCategory.SWCategoryType(rawValue: title.key) ?? RootCategory.SWCategoryType.films)
                    _titles.append(rootTitle)
                }
                self?.titles = _titles.sorted(by: {
                    $0.title < $1.title
                })
            }
        }
    }
}
