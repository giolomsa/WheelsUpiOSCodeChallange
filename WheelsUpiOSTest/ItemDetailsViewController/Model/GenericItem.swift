//
//  GenericItem.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

class GenericItem{
    var propertyDictionary : [String: Any] = [:]
    
    init(data: [String: Any]){
        for item in data{
            self.propertyDictionary[item.key] = item.value
        }
    }
}
