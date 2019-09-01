//
//  DateFormater_Extensions.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 9/1/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

extension Formatter {
    static let iso8601: DateFormatter = {
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .iso8601)
        formatter.locale = Locale.current
        formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSXXXXX"
        return formatter
    }()
}
