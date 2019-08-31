//
//  Int_Extensions.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/30/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

extension Int{
        public var isSuccessHTTPCode: Bool {
            return 200 <= self && self < 300
        }
}
