//
//  Utils.swift
//  SportsStore
//
//  Created by Alexey Danilov on 05.06.2018.
//  Copyright © 2018 danilovdev. All rights reserved.
//

import Foundation

class Utils {
    
    class func currencyStringFromNumber(_ number: Double) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        return formatter.string(for: number)  ?? ""
    }
}
