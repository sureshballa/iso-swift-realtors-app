//
//  GeneralExtensions.swift
//  realtors
//
//  Created by Suresh.Balla on 25/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import Foundation

extension Int {
    var stringValue:String {
        return "\(self)"
    }
}

extension Double {
    var stringValue: String {
        return String(format: "%.2f",self)
    }
    
    var asLocaleCurrency:String {
        let formatter = NSNumberFormatter()
        formatter.numberStyle = .CurrencyStyle
        formatter.locale = NSLocale.currentLocale()
        return formatter.stringFromNumber(self)!
    }
}