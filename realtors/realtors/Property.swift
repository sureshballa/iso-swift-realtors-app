//
//  Property.swift
//  realtors
//
//  Created by Suresh.Balla on 24/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import Foundation

class Property{
    let listingID: Int
    let address: String
    let features: String
    let beds: Int
    let baths: Int
    let estimatedValue: Int
    let changeOverLastYear: Int
    let link: String
    
    init(listingID: Int, address: String, beds: Int, baths: Int, features: String, estimatedValue: Int, changeOverLastYear: Int, link: String){
        
        self.listingID = listingID
        self.address = address
        self.beds = beds
        self.baths = baths;
        self.features = features
        self.estimatedValue = estimatedValue
        self.changeOverLastYear = changeOverLastYear
        self.link = link
    }
}
