//
//  ItemDetailsViewModel.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation
class ItemDetailsViewModel{
    
    static let itemsWereSetNotification = Notification.Name.init(rawValue: "gio.lomsa.ItemsWereSetNotification")
    
    let httpLayer = HTTPLayer()
    let networking: APIClient
    
    var selectedItem: [Category] = []{
        didSet{
            
            NotificationCenter.default.post(name: ItemDetailsViewModel.itemsWereSetNotification, object: nil)
            
        }
    }
    
    init(){
        networking = APIClient(httpLayer: httpLayer)
    }
    
    func loadCategories(for url: String, for category: RootCategory.SWCategoryType){
        networking.getCategoriesDetails(url: url, completion: {[weak self] (result) in
            switch result{
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let categories):
                print(categories.results)
                self?.selectedItem = categories.results
            }
        })
    }
    
    func loadStringFromUrl(urlArray: [String], completion: @escaping([String])->Void){
        var resultString = [String]()
        guard urlArray.count > 0 else {completion([String]()); return}
        for urlString in urlArray{
            networking.getCategoryItems(url: urlString) { (result) in
                switch result{
                case .failure(let error):
                    print(error.localizedDescription)
                case .success(let item):
                    do {
                        let decoder = JSONDecoder()
                        let detailItem = try decoder.decode(DetailItem.self, from: item)
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
}
