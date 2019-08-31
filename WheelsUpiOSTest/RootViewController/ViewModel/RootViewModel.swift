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
    
    var titles: [String] = []{
        didSet{
            print("titles were set")
            NotificationCenter.default.post(name: RootViewModel.rootTitlesWereSetNotification, object: nil)
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    func loadRoot(){
        networking.getRootObjects { (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let titles):
                print(titles)
                var _titles = [String]()
                
                for title in titles.keys{
                    _titles.append(title)
                }
                self.titles = _titles
            }
        }
    }
}
