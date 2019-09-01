////
////  PeopleViewModel.swift
////  WheelsUpiOSTest
////
////  Created by Gio Lomsa on 8/31/19.
////  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
////
//
//import Foundation
//
//class DetailItemsViewModel{
//    
//static let itemWasSetNotification = Notification.Name.init(rawValue: "gio.lomsa.ItemWasSetNotification")
//
//let httpLayer = HTTPLayer()
//let networking: APIClient
//
//var item: DetailItems?{
//    didSet{
//        print("item was set")
//        NotificationCenter.default.post(name: DetailItemsViewModel.itemWasSetNotification, object: nil)
//        
//    }
//}
//
//init(){
//    networking = APIClient(httpLayer: httpLayer)
//}
//
//    func loadCategoryItems(url: String, category: RootCategory.SWCategoryType){
//    networking.getCategoryItems(url: url) { (result) in
//        switch result{
//                    case .failure(let error):
//                        print(error.localizedDescription)
//                    case .success(let itemData):
//                        
//                        let decoder = JSONDecoder()
//                
//                        switch category{
//                        case .people:
//                            do{
//                                let item = try decoder.decode(Person.self, from: itemData)
//                                print(item)
//                                self.item = item
//                            }catch let error{
//                                print(error.localizedDescription)
//                            }
//                        case .films:
//                            do{
//                                let item = try decoder.decode(Film.self, from: itemData)
//                                print(item)
//                            }catch let error{
//                                print(error.localizedDescription)
//                            }
//                        case .planets:
//                            do{
//                                let item = try decoder.decode(Person.self, from: itemData)
//                                print(item)
//                            }catch let error{
//                                print(error.localizedDescription)
//                            }
//                        case .species:
//                            do{
//                                let item = try decoder.decode(Person.self, from: itemData)
//                                print(item)
//                            }catch let error{
//                                print(error.localizedDescription)
//                            }
//                        case .starships:
//                            do{
//                                let item = try decoder.decode(Person.self, from: itemData)
//                                print(item)
//                            }catch let error{
//                                print(error.localizedDescription)
//                            }
//                        case .vheicles:
//                            do{
//                                let item = try decoder.decode(Person.self, from: itemData)
//                                print(item)
//                            }catch let error{
//                                print(error.localizedDescription)
//                            }
//                        }
//                    }
//        }
//    }
//}
