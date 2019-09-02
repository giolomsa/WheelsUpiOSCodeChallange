//
//  ItemDetailsViewModel.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation
class ItemDetailsViewModel{
    
    static let elementDetailsWereSetNotification = Notification.Name.init(rawValue: "gio.lomsa.elementDetailsWereSetNotification")
    
    let httpLayer = HTTPLayer()
    let networking: APIClient

    var elementDetailsObject: GenericItem?{
        didSet{
            NotificationCenter.default.post(name: ItemDetailsViewModel.elementDetailsWereSetNotification, object: nil)
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    func loadStringFromUrl(urlArray: [String], completion: @escaping([String])->Void){
        var resultString = [String]()
        guard urlArray.count > 0 else {completion([String]()); return}
        
        for urlString in urlArray{
            networking.getElementDetails(urlString: urlString) { (result) in
                switch result{
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let detailsItem):
                    do {
                        let decoder = JSONDecoder()
                        let detailItem = try decoder.decode(DetailsItem.self, from: detailsItem)
                        if let title = detailItem.title{
                            resultString.append(title)
                            completion(resultString)
                        }
                        if let name = detailItem.name{
                            resultString.append(name)
                            completion(resultString)
                        }
                    } catch let error as NSError {
                        print(error)
                    }
                }
            }
        }
    }
    
    func loadDataFromUrl(url: String){
        networking.getElementDetails(urlString: url) {[weak self] (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let detailsItem):
                do {
                    if let json = try JSONSerialization.jsonObject(with: detailsItem, options: .mutableContainers) as? [String: Any]{
                        self?.elementDetailsObject = GenericItem(data: json)
                    }
                } catch let error as NSError {
                    print(error)
                }
            }
        }
    }
}
