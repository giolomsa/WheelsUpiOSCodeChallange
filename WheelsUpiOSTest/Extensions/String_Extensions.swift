//
//  String_Extensions.swift
//  WheelsUpiOSTest
//
//  Created by Gio Lomsa on 8/31/19.
//  Copyright © 2019 Giorgi Lomsadze. All rights reserved.
//

import Foundation

extension String{
    var firstAndSecondWordFirstLetters: String{
        let stringArraySeparated = self.components(separatedBy: " ")
        let firstLetter = String(stringArraySeparated.first?.first ?? Character(""))
        var secondLetter = ""
        if stringArraySeparated.count > 1{
            secondLetter = String(stringArraySeparated[1].first ?? Character(""))
        }else{
            secondLetter = ""
        }
        
        return "\(firstLetter.capitalized)\(secondLetter.capitalized)"
    }
    
    var capitalizedStringFromSnakeCase: String{
        return self.replacingOccurrences(of: "_", with: " ").capitalized
    }
}
