//
//  Property.swift
//  realtors
//
//  Created by Suresh.Balla on 24/03/16.
//  Copyright © 2016 sureshballa. All rights reserved.
//

import Foundation

//Property class with immutable values as this class state will not be changed given the scope
class Property{
    let listingID: Int
    let address: String
    let features: String?
    let beds: Int
    let baths: Int
    let estimatedValue: Double?
    let changeOverLastYear: Double?
    let link: String?
    let imageLink: String
    
    init(listingID: Int, address: String, beds: Int, baths: Int, features: String, estimatedValue: Double, changeOverLastYear: Double, link: String, imageLink: String){
        
        self.listingID = listingID
        self.address = address
        self.beds = beds
        self.baths = baths;
        self.features = features
        self.estimatedValue = estimatedValue
        self.changeOverLastYear = changeOverLastYear
        self.link = link
        self.imageLink = imageLink
    }
    
    init(listingID: Int, address: String, beds: Int, baths: Int, imageLink: String){
        
        self.listingID = listingID
        self.address = address
        self.beds = beds
        self.baths = baths
        self.imageLink = imageLink
        
        self.features = nil
        self.estimatedValue = nil
        self.changeOverLastYear = nil
        self.link = nil
    }

}
